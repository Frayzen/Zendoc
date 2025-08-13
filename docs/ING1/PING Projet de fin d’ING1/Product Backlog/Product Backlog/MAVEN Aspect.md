---
title: MAVEN Aspect
Status: Merged
Assign: Matcha
Branch: slm-maven
Allows:
  - "[[Aspects]]"
  - "[[MAVEN Features]]"
  - "[[Features]]"
Depends:
  - "[[PingAspect class]]"
  - "[[Filter method]]"
Feature: Backend
---
# Description
The MavenAspect class is the implementation of the PINGAspect class. It represents an aspect of a project.

> [!important] You can use the FilterMethod class tool to find the Files you want. It can be usefull, especially for the
> 
> **match** method.
# Deliverable
- MavenAspect _implements PINGAspect_
    
    > [!important] You
    > 
    > **do not need** to implement the FeatureList for the moment. Just return an empty array.