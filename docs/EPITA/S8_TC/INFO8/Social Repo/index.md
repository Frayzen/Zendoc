---
title: "Social Repo"
---
Last edited time: March 26, 2025 6:00 PM

[Redis](Social%20Repo/Redis.md)

### **Task: `repo-social`**

You're responsible for implementing the **Social Repository**, which handles:

- Follow/unfollow relationships
- Block/unblock actions
- Like/unlike posts
- Querying social graphs (followers, following, blocks, liked posts)

From the file structure, here's what's relevant to you:

---

### **Key Files in `repo-social`**

### **1. Source Code (`src/main/`)**

| **File/Directory** | **Purpose** |
| --- | --- |
| `java/com/epita/` | Contains Java classes for controllers, services, repositories (you'll add these). |
| `resources/` | Configuration and test requests: |
| - `application.properties` | Database connections (Neo4j, Redis), Quarkus config. |
| - `requests.http` | HTTP client tests (like Postman) to manually test endpoints. |

### **2. Tests (`src/test/`)**

| **File** | **Purpose** |
| --- | --- |
| `SocialControllerTest.java` | Tests REST endpoints (e.g., `POST /follow`). |
| `SocialRepositoryTest.java` | Tests database queries (Neo4j/Redis). |
| `SocialServiceTest.java` | Tests business logic (e.g., "blocking a user removes follows"). |

### **3. Deployment (`k8s/repo-social/`)**

| **File** | **Purpose** |
| --- | --- |
| `deployment.yml` | Kubernetes config to deploy your service. |
| `service.yml` | Exposes your service to other pods. |
| `secrets.yml` | Stores credentials for Neo4j/Redis (secured). |

### **4. Root Files**

| **File** | **Purpose** |
| --- | --- |
| `pom.xml` | Maven dependencies (Neo4j, Redis, Quarkus). Ensure these are present:

`xml <dependency> <groupId>io.quarkus</groupId> <artifactId>quarkus-neo4j</artifactId> <!-- Neo4j graph DB --> </dependency>`  |
| `Dockerfile` | Builds your service into a container. |

---

### **Step-by-Step Plan**

### **Phase 1: Setup (Day 1)**

1. **Configure Databases**
    - **Neo4j**: Store social graphs (follows, blocks).
        - Example `application.properties`:
            
            properties
            
            Copy
            
            ```
            quarkus.neo4j.uri=bolt://neo4j:7687
            quarkus.neo4j.authentication.username=neo4j
            quarkus.neo4j.authentication.password=${NEO4J_PASSWORD}
            ```
            
    - **Redis**: Publish events (e.g., `user.blocked` for `home-timeline` to update feeds).
2. **Define Data Models**
    - **Neo4j Nodes/Relationships**:
        
        java
        
        Copy
        
        ```
        @Node("User")
        public class User {
            @Id String userId;
            @Relationship(type = "FOLLOWS", direction = OUTGOING) List<User> follows;
            @Relationship(type = "BLOCKS", direction = OUTGOING) List<User> blocks;
        }
        ```
        
    - **Redis Keys**:
        - `likes:post:{postId}` → Set of user IDs who liked the post.

### **Phase 2: Implement Core Features (Days 2-3)**

1. **Repository Methods (Neo4j + Redis)**
    - **Follow/Unfollow**:
        
        ```java
        public void follow(String followerId, String followeeId) {
            // Neo4j: CREATE (follower)-[:FOLLOWS]->(followee)
            // Redis: Publish "user.followed" event
        }
        ```
        
    - **Block/Unblock**:
        - Delete follow relationships bidirectionally (async via Redis).
    - **Like/Unlike**:
        - Use Redis sets for fast like tracking:
            
            
            ```java
            redis.sadd("likes:post:" + postId, userId);
            ```
            
2. **Queries**
    - **Get Followers/Following**:
        
        cypher
        
        ```
        MATCH (u:User {userId: $userId})<-[:FOLLOWS]-(follower) RETURN follower
        ```
        
    - **Check if Blocked**:
        
        cypher
        
        ```
        MATCH (u1:User {userId: $user1Id})-[:BLOCKS]->(u2:User {userId: $user2Id}) RETURN COUNT(*) > 0
        ```
        

### **Phase 3: Integrate & Test (Day 4)**

1. **REST Endpoints**
    - Example (`SocialController.java`):
        
        java
        
        ```java
        @POST
        @Path("/follow")
        public Response follow(@QueryParam("follower") String followerId, @QueryParam("followee") String followeeId) {
            socialService.follow(followerId, followeeId);
            return Response.ok().build();
        }
        ```
        
    - Add to `requests.http`:
        
        http
        
        ```
        POST http://localhost:8080/follow?follower=user1&followee=user2
        ```
        
2. **Test**
    - **Unit Tests**: Mock Neo4j/Redis in `SocialRepositoryTest.java`.
    - **Integration Tests**: Use Testcontainers to spin up real databases.

### **Phase 4: Deploy (Day 5)**

1. **Kubernetes**
    - Update `k8s/repo-social/deployment.yml` with your service’s image.
    - Verify secrets (`secrets.yml`) match your `application.properties`.
2. **Verify**
    - Port-forward and test endpoints:
        
        sh
        
        ```bash
        kubectl port-forward svc/repo-social 8080:80
        ```
        

---

### **Key Dependencies**

Ensure `pom.xml` includes:

xml

```html
<dependency><groupId>io.quarkus</groupId><artifactId>quarkus-neo4j</artifactId> <!-- Neo4j -->
</dependency><dependency><groupId>io.quarkus</groupId><artifactId>quarkus-redis-client</artifactId> <!-- Redis -->
</dependency><dependency><groupId>org.neo4j</groupId><artifactId>neo4j-ogm-core</artifactId> <!-- Neo4j OGM -->
</dependency>
```

Run HTML

---

### **Example Workflow: Blocking a User**

1. **HTTP Request**: `POST /block?blocker=user1&blocked=user2`
2. **Service Logic**:
    - Neo4j: Create `(user1)-[:BLOCKS]->(user2)`.
    - Neo4j: Remove `(user1)-[:FOLLOWS]->(user2)` and vice versa.
    - Redis: Publish `user.blocked` event (for timeline services).
3. **Response**: `200 OK`.

---

### **Tips**

- **Use Cypher Queries**: Optimize Neo4j traversals (e.g., shortest path for social graph proximity).
- **Atomic Operations**: Use Redis transactions (`MULTI/EXEC`) for like/unlike.
- **Logging**: Add `quarkus.log.console.format` in `application.properties` for debug.

Let me know if you'd like a skeleton code for any file!
