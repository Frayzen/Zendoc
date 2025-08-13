---
Owner: "Florian "
---
# Overview
The IP protocol aims to address the issue of the volatility of [[ING1/NET1 Network/Structures/MAC Address/MAC Address]].
For example, if you connect to another wifi, all the [[Devices]] need to wipe out your MAC address all across the world. That requires a lot of resources that could be saved.
Here comes the ip protocol !
[![](https://media1.giphy.com/media/MxZBuBBPqdCQU/giphy.gif?cid=7941fdc6b9mxld28rd82cjjwcc3et3vhkpl1z4qhvzt54i3v&ep=v1_gifs_search&rid=giphy.gif&ct=g)](https://media1.giphy.com/media/MxZBuBBPqdCQU/giphy.gif?cid=7941fdc6b9mxld28rd82cjjwcc3et3vhkpl1z4qhvzt54i3v&ep=v1_gifs_search&rid=giphy.gif&ct=g)
The ip protocols provides another unique identifier: the ip.
It is an identifier made up of 32 bits only and written as 4 decimal numbers separated by dots.

> [!important] Example: 172.67.71.150
## Look up my IP 👀
The linux “ip address” command is a great tool to show useful information about the ip of your interfaces (virtual **and** physical).
```Bash
ip address # or ip a
```
![[Untitled 131.png|Untitled 131.png]]

> [!important] A machine could have more than one IP, even on the same interface
## Local IP network
On a local network, one can talk with all the addresses having the same **prefix**.
A prefix defines a specific amount of bits that will be consider as “header” of the address. Therefore, all ip addresses can be divided in two distinct part: the prefix and the host.
![[Untitled 1 91.png|Untitled 1 91.png]]
The usage of the “ _/ 19_” specify that the prefix length is 19.
- This address is part of the 172.17.0.0/19 (sub)net.
- The first usable address of this net is 172.17.0.1, the last one is 172.17.31.254.
Example here:
- 172.17.31.1 is another IP on the same network;
- 172.17.13.37 is another IP on the same network;
- 172.17.32.2 is an IP on another network;
- 172.17.0.0 is the first IP of the range, it cannot be used as an address: this is the prefix.
- 172.17.31.255 is the last IP of the range, it cannot be used as an address: this is the broadcast address.
### Classes
Some standard prefix length are called “class”.
Class A = “/8” = 255.0.0.0;  
Class B = “/16” = 255.255.0.0;  
Class C = “/24” = 255.255.255.0

> [!important] Nowadays, the prefix length is arbitrary in that notion of class is outdated
# IP assignation
IP addresses are globally unique ressources assigned by a central authority. IP addresses are globally unique resources managed and allocated by a central authority (IANA and RIRs) to ensure that every device connected to the Internet has a unique identifier and to facilitate the efficient operation of the global Internet
![[Untitled 2 66.png|Untitled 2 66.png]]
- **IANA**: The IANA manages the allocation of IP address space to the five regional Internet registries (RIRs)
- **Allocation Policies**: The allocation of IP address space is governed by policies developed through community consensus within each RIR's region.
# Address Resolution Protocol
ARP is a request-response protocol used for discovering the link layer address associated with a given internet layer address.
The linux “ip neighbour” command is a great tool to show useful information about the IPs associated with a MAC address.
```Bash
ip address # or ip n
```

> [!important] ARP is an Ethernet protocol (Ethertype: 0x0806)
> 
>   
> An equivalent of the ping command exists for arp. It is called **arping**