---
title: Shell exec class
Status: Merged
Assign: Tim Pearson
Branch: tim-shell-exec
Allows:
  - "[[ANY Features]]"
  - "[[GIT Features]]"
  - "[[MAVEN Features]]"
Feature: Backend
---
# Description
Create class to handle shell commands
# Deliverable
- PingShellExec
    
    - PingShellExec(String[] args)
    - getReturn()
    - getOutput()
    
    > [!important] GetOutput returns both stderr and stdout