---
Status: Merged
Assign: EElies Mansouri
Branch: node_service-Elies
Allows:
  - "[[Get Node from Path]]"
  - "[[Update Architecture Node Service]]"
Depends:
  - "[[PING File class]]"
  - "[[PING Folder class]]"
Feature: Backend
---
# Description
implement the NodeService interface for the two classes that implement the Node interface: PingFile and PingFolder
# Deliverable
  
  
public class NodeServiceClass _implement NodeService_
- update()
- delete()
- create()
- move()