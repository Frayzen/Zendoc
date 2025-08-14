---
title: PingAspect class
Status: Merged
Assign: Matcha
Branch: slm-aspect
Allows:
  - "[[GIT Aspect]]"
  - "[[ANY Aspect]]"
  - "[[MAVEN Aspect]]"
Feature: Backend
---
# Description
create a interface that extends the given Aspect interface (see Aspect.java)
Add the match method body. It should return a boolean saying if the given root node fits the aspect.

> [!important] Do
> 
> **NOT** implement the match method. It is gonna be implemented in the Aspect classes later on.
## Example
A Git project contains a .git folder.
# Deliverable
- PingAspect
    - match(Node) → boolean