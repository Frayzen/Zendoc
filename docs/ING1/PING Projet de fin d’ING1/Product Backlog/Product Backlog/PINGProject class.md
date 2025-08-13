---
Status: Merged
Assign: "Florian "
Branch: flo-project-class
Allows:
  - "[[Project service impl]]"
  - "[[Project exec feature]]"
Depends:
  - "[[Build file tree method]]"
  - "[[Aspects]]"
Feature: Backend
---
# Description
Create the PINGProject class. It implements the Project interface. It should build the file tree accordingly. It should also set up the Aspects accordingly.
# Deliverable
- PINGProject _implements Project_
    - getRootNode()
    - getAspects()
    - PINGProject(String rootPath)

> [!important] No need to implement getFeature and getFeatures for the moment !