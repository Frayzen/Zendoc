---
title: Process Manager
Status: Not started
Allows:
  - "[[Assignable button]]"
  - "[[Process saver]]"
Depends:
  - "[[Process recorder]]"
Feature: Custom buttons
---
# Description
A way to manager the recorded process. It should acts as the interface between the buttons that executes the process and the record of processes.
# Deliverable
The ability to browse, and remove actions among all the process recorded
- ProcessManager
    - addProcess
    - removeProcess
    - getProcesses
    - assignProcess(uid, process)
    - retrieveProcess(uid)