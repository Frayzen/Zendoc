---
title: Filter method
Status: Merged
Assign: "Florian "
Branch: flo-filter
Allows:
  - "[[GIT Aspect]]"
  - "[[MAVEN Aspect]]"
  - "[[ANY Aspect]]"
Depends:
  - "[[PING File class]]"
  - "[[PING Folder class]]"
Feature: Backend
---
# Description
create the Filter class that we will use to get a list of Nodes matching a condition from a given root node.
# Deliverable
```Java
class Filter {
    interface Condition {
        boolean test(final Node o);
    }
    public static List<Node> filter(final Node node, final Condition condition) {
        //TODO
    }
}
```