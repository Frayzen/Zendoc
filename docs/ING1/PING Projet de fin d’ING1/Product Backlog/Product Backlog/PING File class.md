---
Status: Merged
Assign: "Florian "
Branch: flo-ping-file
Allows:
  - "[[Node service impl]]"
  - "[[PING Folder class]]"
  - "[[Filter method]]"
  - "[[Build file tree method]]"
Feature: Backend
---
# Description
Create the basic PINGFile class. It should implement the node interface. The constructor takes a java File type and create the associated File.
# Deliverable
- PINGFile _implements Node_
    - PINGFile(java.File)