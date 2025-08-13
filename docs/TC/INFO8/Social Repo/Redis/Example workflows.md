---
Owner: Tim Pearson
---
### **1. Redis Setup (Behind the Scenes)**
- **Deployment**:
    
    Redis runs as a separate container (see `k8s/redis/` in your project).
    
    - Configured in `application.properties`:
        
        .properties
        
        ```Plain
        quarkus.redis.hosts=redis://redis:6379
        ```
        
- **Connection**:
    
    Quarkus auto-injects the Redis client:
    
    ```Java
    @Inject RedisClient redis;
    ```
    
---
### **Example 1: Caching a Block Relationship**
### **Scenario**
Before allowing a user to reply to a post, `repo-post` must check if the author blocked them.
### **Step-by-Step**
1. **Check Cache First** (Fast path):
    
    ```Java
    boolean isBlocked = redis.get("block:authorId:commenterId") != null;
    ```
    
    - If `true`, reject the reply immediately.
2. **Cache Miss → Query Neo4j**:
    
    ```Java
    if (!isBlocked) {
        isBlocked = neo4j.query("MATCH (a:User {userId: $authorId})-[:BLOCKS]->(c:User {userId: $commenterId}) RETURN COUNT(*) > 0");
        // Cache result for future checks
        redis.setex("block:" + authorId + ":" + commenterId, 300, "true");
    }
    ```
    
### **Why This Matters**
- Avoids expensive Neo4j traversals for repeated checks.
- 300-second TTL balances freshness and performance.
---
### **Example 2: Publishing a "User Followed" Event**
### **Scenario**
When UserA follows UserB, `home-timeline` must rebuild UserA’s feed.
### **Step-by-Step**
1. `**repo-social**` **saves follow in Neo4j**:
    
    cypher:
    
    ```Plain
    MATCH (a:User {userId: "userA"}), (b:User {userId: "userB"})
    CREATE (a)-[:FOLLOWS]->(b)
    ```
    
2. **Publish Redis Event**:
    
    ```Java
    redis.publish("user.followed", "{\"follower\":\"userA\",\"followee\":\"userB\"}");
    ```
    
3. `**home-timeline**` **listens and reacts**:
    
    ```Java
    @Incoming("user.followed")
    void onFollow(String message) {
        JsonObject json = new JsonObject(message);
        rebuildTimeline(json.getString("follower"));
    }
    ```
    
### **Why Pub/Sub?**
- Decouples `repo-social` from `home-timeline`.
- Async processing prevents HTTP timeouts.
---
### **Example 3: Tracking Post Likes in Real-Time**
### **Scenario**
When a post is liked, update `user-timeline` and `home-timeline`.
### **Step-by-Step**
1. `**repo-social**` **records like in MongoDB**:
    
    ```Java
    mongo.collection("likes").insertOne(new Like(postId, userId, Instant.now()));
    ```
    
2. **Update Redis Cache**:
    
    ```Java
    redis.sadd("likes:post:" + postId, userId);  // Add to likes set
    redis.expire("likes:post:" + postId, 86400); // Keep for 1 day
    ```
    
3. **Publish Event**:
    
    ```Java
    redis.publish("post.liked", "{\"postId\":\"" + postId + "\", \"userId\":\"" + userId + "\"}");
    ```
    
4. **Timeline services consume the event**:
    
    ```Java
    @Incoming("post.liked")
    void onLike(String message) {
        // Update timelines in background
        executor.submit(() -> updateTimelines(message));
    }
    ```
    
### **Why Redis Sets?**
- Fast membership checks (`SISMEMBER likes:post:123 user456`).
- Avoid duplicate likes.
---
### **Example 4: Rate Limiting API Calls**
### **Scenario**
Prevent abuse of the "like" endpoint (e.g., max 10 likes/minute per user).
### **Step-by-Step**
1. **Track Attempts**:
    
    ```Java
    String key = "rate_limit:like:" + userId;
    long count = redis.incr(key);
    if (count == 1) {
        redis.expire(key, 60); // Reset every minute
    }
    ```
    
2. **Enforce Limit**:
    
    ```Java
    if (count > 10) {
        throw new RateLimitExceededException();
    }
    ```
    
### **Why Redis?**
- Atomic operations (`INCR` + `EXPIRE`).
- Shared state across service instances.
---
### **Behind the Scenes: How Redis Works**
1. **In-Memory Data Store**:
    - All data lives in RAM (microsecond access).
    - Periodically persisted to disk (if configured).
2. **Pub/Sub Mechanics**:
    - Channels are lightweight message queues.
    - Subscribers get messages in real-time.
3. **Atomicity**:
    - Commands like `SETEX`, `SADD` are atomic.
    - No race conditions in distributed systems.