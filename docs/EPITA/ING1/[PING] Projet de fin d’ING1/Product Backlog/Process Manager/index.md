---
title: "Process Manager"
---
Allows: Assignable button (Assignable%20button.md), Process saver (Process%20saver.md)
Depends: Process recorder (Process%20recorder.md)
Feature: Custom buttons

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
