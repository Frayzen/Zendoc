---
title: IPv6 protocol
Owner: "Florian "
---
# Why IPv4 is not enough ?
- IPs should be unique to communicate with one another.
- IPv4 is 4 bytes, ie 232 addresses (4 billions). In reality, way less because of:
    - Reserved subnets (non-routable, multicast, etc).
    - Granularity due to subnetting/routing.
    - Hoarding.
![[Untitled 133.png|Untitled 133.png]]

# IPv6 to the rescue
[![](https://media2.giphy.com/media/l396BoOTIFem9xqQU/giphy.gif?cid=7941fdc65djb4ve1q85wez4h9c8dvffeplskl7irdtz2ptld&ep=v1_gifs_search&rid=giphy.gif&ct=g)](https://media2.giphy.com/media/l396BoOTIFem9xqQU/giphy.gif?cid=7941fdc65djb4ve1q85wez4h9c8dvffeplskl7irdtz2ptld&ep=v1_gifs_search&rid=giphy.gif&ct=g)
- More granularity: switching from classes (/8,/16 or /24), to Classless Inter-Domain Routing (CIDR) with any prefix length
- Use of private addresses for personnal computer
- These IPs are not globally unique: they can only be used on a local network, not on the Internet: we need Network Address Translation (NAT) ⇝ more complex routers