---
title: "PingAspect class"
---
Assign: Matcha
Branch: slm-aspect
Allows: GIT Aspect (GIT%20Aspect.md), ANY Aspect (ANY%20Aspect.md), MAVEN Aspect (MAVEN%20Aspect.md)
Feature: Backend

# Description

create a interface that extends the given Aspect interface (see Aspect.java)

Add the match method body. It should return a boolean saying if the given root node fits the aspect.

<aside>
⚠️ Do **NOT** implement the match method. It is gonna be implemented in the Aspect classes later on.

</aside>

## Example

A Git project contains a .git folder.

# Deliverable

- PingAspect
    - match(Node) → boolean
