---
Status: Merged
Assign: "Florian "
Branch: flo-ping-folder
Allows:
  - "[[Node service impl]]"
  - "[[Filter method]]"
  - "[[Build file tree method]]"
Depends:
  - "[[PING File class]]"
Feature: Backend
---
# Description
Create the basic PINGFolder class. It should implement the node interface. The constructor takes a java File type.
# Deliverable
- PINGFolder _implements Node_
    
    - PINGFolder(java.File)
    
    > [!important] No need to recursively create the associated tree hierarchy as it is another task.