---
title: Redis
Owner: Tim Pearson
---
[[Example workflows]]
### **1. Redis’s Core Role in Your Project**
Redis is primarily used for two purposes in your architecture:
1. **Pub/Sub Messaging** (Asynchronous communication between services).
2. **Caching** (Optimizing read-heavy operations, like social graph queries).
---
### **2. Why Redis for** `**repo-social**`**?**
### **A. Handling Real-Time Events**
Your `repo-social` service triggers events that other services depend on. Examples:
- When a user **follows/unfollows** someone, `home-timeline` needs to update feeds.
- When a user **likes/unlikes** a post, both `user-timeline` and `home-timeline` must reflect this.
- When a user **blocks** someone, `repo-post` must validate replies/reposts.
**Without Redis**:
You’d need direct HTTP calls between services, creating:
- Tight coupling (if one service crashes, others fail).
- Latency (HTTP overhead).
- Complexity (retry logic, timeouts).
**With Redis Pub/Sub**:
- `repo-social` publishes an event (e.g., `user.followed`).
- Other services subscribe and react **asynchronously**.
- Decoupled, scalable, and fault-tolerant.
### **B. Caching Hot Data**
- **Social graph queries** (e.g., "Is user X blocking user Y?") are frequent.
- Instead of querying Neo4j every time, cache results in Redis (sub-millisecond reads).
Example:
```Java
// Cache a block relationship for 5 minutes
redis.setex("block:user1:user2", 300, "true");
```
---
### **3. Concrete Use Cases in Your Project**
|   |   |
|---|---|
|**Service**|**Redis Usage**|
|**repo-social**|- Publishes events: `user.followed`, `user.blocked`, `post.liked`.  <br>- Caches follow/block lists to reduce Neo4j load.|
|**repo-post**|Listens for `user.blocked` to validate replies/reposts.|
|**home-timeline**|Subscribes to `user.followed` and `post.liked` to rebuild timelines.|
|**user-timeline**|Listens for `post.liked` to update user-specific timelines.|
|**srvc-search**|Listens for `post.created` and `post.deleted` to update Elasticsearch.|
---
### **4. How Redis Pub/Sub Works**
1. `**repo-social**` **publishes an event**:
    
      
    
    ```Java
    // When a user likes a post
    redis.publish("post.liked", "{postId: 123, userId: 456}");
    ```
    
2. `**home-timeline**` **subscribes to the event**:
    
      
    
    ```Java
    redis.subscribe("post.liked", (message) -> {
        rebuildTimeline(message.getUserId());
    });
    ```
    
---
### **5. Why Not Use a Database Queue (e.g., MongoDB)?**
- **Redis is faster**: In-memory operations (microseconds vs. milliseconds).
- **Built for real-time**: Databases prioritize durability over speed.
- **Simpler scaling**: Redis handles 100K+ messages/sec easily.
---
### **6. What Happens Without Redis?**
- **Timelines become stale**: Users see outdated feeds until the next manual refresh.
- **Poor performance**: Neo4j/HTTP calls bottleneck under load.
- **Tight coupling**: Services crash if dependencies fail.
---
### **7. Key Redis Commands You’ll Use**
|   |   |   |
|---|---|---|
|**Command**|**Purpose**|**Example**|
|`PUBLISH`|Send an event to subscribers.|`PUBLISH post.liked '{"postId": 123}'`|
|`SUBSCRIBE`|Listen for events.|`SUBSCRIBE post.liked`|
|`SETEX`|Cache data with expiration.|`SETEX block:user1:user2 300 true`|
|`GET`|Read cached data.|`GET block:user1:user2`|
---
### **8. Practical Example**
When a user likes a post (`repo-social`):
1. **Validate** the like (no block relationship).
2. **Persist** the like in Neo4j/MongoDB.
3. **Publish** a Redis event:
    
    ```Java
    redis.publish("post.liked", "{postId: 123, userId: 456, timestamp: 1690000000}");
    ```
    
4. **Timeline services** update asynchronously.
---
### **9. Summary: Why Redis is Mandatory**
- **Decouples services**: No direct HTTP dependencies.
- **Real-time updates**: Critical for social apps.
- **Performance**: Caches hot data, reduces database load.
- **Resilience**: Messages persist even if a service crashes.