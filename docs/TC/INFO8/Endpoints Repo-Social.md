---
Owner: Tim Pearson
---
# Like/Unlike
- takes user**,** post
- get the owner of the post
- check if owner blocked user
  
  
### Follow
- takes cur user and target user
- check if cur = target
- check if already following
- check if target blocked current
  
### Unfollow
  
- takes cur user and target user
- check if cur = target
- check if they are following initially
  
  
### Block
- takes cur user and target
- check if cur == target
- check if already blocked
- remove all likes from target on curs posts
- remove follows both directions
  
### Unblock
- takes cur user and target
- check if cur == target
- check if blocked initially
  
### Get Users that liked a post
- takes cur user and post
- check that owner of post is not blocking cur
  
### Get posts liked by user
- takes cur user and target user
- check if target blocks cur
  
### Get all posts from a user
- takes cur user and target user
- check if target blocks cur
  
### Get followers of a user
- takes cur user and target user
- check if target blocks cur
  
### Get a users follows
- takes cur and target users
- check if target block cur
  
### Get users that blocked current user
- takes cur and target users
  
### get