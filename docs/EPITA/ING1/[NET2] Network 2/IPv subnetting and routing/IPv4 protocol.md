---
title: IPv4 protocol
---
Last edited time: May 28, 2024 5:22 AM

# Overview

The IP protocol aims to address the issue of the volatility of [MAC addresses](MAC%20Address.md).

For example, if you connect to another wifi, all the [switches tables](Devices.md) need to wipe out your MAC address all across the world. That requires a lot of resources that could be saved.

Here comes the ip protocol !

![](https://media1.giphy.com/media/MxZBuBBPqdCQU/giphy.gif?cid=7941fdc6b9mxld28rd82cjjwcc3et3vhkpl1z4qhvzt54i3v&ep=v1_gifs_search&rid=giphy.gif&ct=g)

The ip protocols provides another unique identifier: the ip.

It is an identifier made up of 32 bits only and written as 4 decimal numbers separated by dots.

<aside>
💡 Example: 172.67.71.150

</aside>

## Look up my IP 👀

The linux “ip address” command is a great tool to show useful information about the ip of your interfaces (virtual **and** physical).

```bash
ip address # or ip a
```

![Untitled](IPv4%20protocol/Untitled.png)

<aside>
💡 A machine could have more than one IP, even on the same interface

</aside>

## Local IP network

On a local network, one can talk with all the addresses having the same **prefix**.

A prefix defines a specific amount of bits that will be consider as “header” of the address. Therefore, all ip addresses can be divided in two distinct part: the prefix and the host.

![Untitled](IPv4%20protocol/Untitled%201.png)

The usage of the “ */ 19*” specify that the prefix length is 19.

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

<aside>
🧠 Nowadays, the prefix length is arbitrary in that notion of class is outdated

</aside>

# IP assignation

IP addresses are globally unique ressources assigned by a central authority. IP addresses are globally unique resources managed and allocated by a central authority (IANA and RIRs) to ensure that every device connected to the Internet has a unique identifier and to facilitate the efficient operation of the global Internet

![Untitled](IPv4%20protocol/Untitled%202.png)

- **IANA**: The IANA manages the allocation of IP address space to the five regional Internet registries (RIRs)
- **Allocation Policies**: The allocation of IP address space is governed by policies developed through community consensus within each RIR's region.

# Address Resolution Protocol

ARP is a request-response protocol used for discovering the link layer address associated with a given internet layer address.

[Address Resolution Protocol (ARP)](../../%5BNET1%5D%20Network/ISO%20OSI/2%20Liaison.md) 

The linux “ip neighbour” command is a great tool to show useful information about the IPs associated with a MAC address.

```bash
ip address # or ip n
```

<aside>
⚠️ ARP is an Ethernet protocol (Ethertype: 0x0806)
An equivalent of the ping command exists for arp. It is called **arping**

</aside>
