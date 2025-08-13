---
title: Payload
Owner: "Florian "
---
# Overview
![[Untitled 129.png|Untitled 129.png]]

- Source is before Destination
- Checksum is computed without the header part but rather uses only the payload.
    
    > [!important] a checksum is a value computed from data to detect errors or ensure data integrity during transmission or storage
    
- IP protocol is not correlated to [[Ethernet Frame]]:
    - IP maximum payload is larger than Ethernet maximum payload. If the payload is too large, the IP payload will be sent as several [[Ethernet Frame]].
    - IP Packets may be carried by other protocols than Ethernet