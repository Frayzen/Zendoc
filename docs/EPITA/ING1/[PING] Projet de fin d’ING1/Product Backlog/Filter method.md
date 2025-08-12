---
title: "Filter method"
---
Assign: Florian 
Branch: flo-filter
Allows: GIT Aspect (GIT%20Aspect.md), MAVEN Aspect (MAVEN%20Aspect.md), ANY Aspect (ANY%20Aspect.md)
Depends: PING File class (PING%20File%20class.md), PING Folder class (PING%20Folder%20class.md)
Feature: Backend

# Description

create the Filter class that we will use to get a list of Nodes matching a condition from a given root node.

# Deliverable

```java
class Filter {
    interface Condition {
        boolean test(final Node o);
    }

    public static List<Node> filter(final Node node, final Condition condition) {
        //TODO
    }
}

```
