---
title: "Social Repositories"
---
Last edited time: April 2, 2025 7:34 PM

### PostRepository

```java
@ApplicationScoped
public class PostRepository extends Neo4jBaseRepository {
    public Post createPost(String userId, String content) {...}
    public boolean deletePost(String postId, String userId) {...}
    public Post getPost(String postId) {...}
    public List<Post> getUserPosts(String userId) {...}
    public List<Post> getPostReplies(String postId) {...}
    public List<Post> getPostReposts(String postId) {...}
    public boolean isPostBlocked(String viewerId, String postId) {...}
}
```

### 2. RelationshipRepository

```java
@ApplicationScoped
public class UserRelationshipRepository extends Neo4jBaseRepository {
    public boolean followUser(String followerId, String followeeId) {...}
    public boolean unfollowUser(String followerId, String followeeId) {...}
    public boolean blockUser(String blockerId, String blockedId) {...}
    public boolean unblockUser(String blockerId, String blockedId) {...}
    public Set<String> getFollows(String userId) {...}
    public Set<String> getFollowers(String userId) {...}
    public Set<String> getBlockedUsers(String userId) {...}
    public Set<String> getUsersWhoBlocked(String userId) {...}
    public boolean hasBlockRelationship(String user1Id, String user2Id) {...}
}
```

### 

```java
@ApplicationScoped
public class LikeRepository extends Neo4jBaseRepository {
    public Like createLike(String userId, String postId) {...}
    public boolean removeLike(String userId, String postId) {...}
    public Set<String> getUsersWhoLiked(String postId) {...}
    public Set<String> getLikedPosts(String userId) {...}
    public boolean hasLiked(String userId, String postId) {...}
}
```

### 4. TimelineRepository

```java
@ApplicationScoped
public class TimelineRepository extends Neo4jBaseRepository {
    public List<Post> getUserTimeline(String userId) {...}
    public List<PostWithActor> getHomeTimeline(String userId) {...}
    public void updateTimelinesForPost(String postId) {...}
    public void updateTimelinesForUserFollow(String followerId, String followeeId) {...}

    public record PostWithActor(Post post, String actorId) {}
}
```
