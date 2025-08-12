---
title: "Build file tree method"
---
Assign: Florian 
Branch: flo-build-file-tree
Allows: PINGProject class (PINGProject%20class.md)
Depends: PING File class (PING%20File%20class.md), PING Folder class (PING%20Folder%20class.md)
Feature: Backend

# Description

We need a way to recursively create a folder’s associated tree hierarchy. Therefore, we are going to add a method to the existing PINGFolder class.

# Deliverable

- PINGFolder
    - **static** createHierarchy() → PINGFolder
