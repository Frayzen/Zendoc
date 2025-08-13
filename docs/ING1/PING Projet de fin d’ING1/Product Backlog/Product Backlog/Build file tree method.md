---
title: Build file tree method
Status: Merged
Assign: "Florian "
Branch: flo-build-file-tree
Allows:
  - "[[PINGProject class]]"
Depends:
  - "[[PING File class]]"
  - "[[PING Folder class]]"
Feature: Backend
---
# Description
We need a way to recursively create a folder’s associated tree hierarchy. Therefore, we are going to add a method to the existing PINGFolder class.
# Deliverable
- PINGFolder
    - **static** createHierarchy() → PINGFolder