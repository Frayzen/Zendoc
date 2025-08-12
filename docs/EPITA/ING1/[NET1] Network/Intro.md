---
title: "Intro"
---
Last edited time: October 26, 2023 3:49 PM

# Classification criteria

## Aperture

- Internal private network (intranet)
- Public private network (internet
- External private network (extranet)

## Range

- PAN (Personal Area Network) : phone to headphones
- LAN (Local Area Network) : Local computer connection (*wlan if wireless*)
- MAN (Metropolitan Area Network) : Differents lan (*wman if wireless*)
- WAN (Wide Area Network) : country or continent level
- GAN (Global Area Network) : Global Network, Internet

## Topology

### Bus

![Untitled](Intro/Untitled.png)

- Everything connected to a single cable
- One-Way communication
- MAC Protocol mandatory
- Not robust

### Ring

![Untitled](Intro/Untitled%201.png)

- Unidirectional data-flow
- Cheap
- A single node can cause the entire network to fail

### Star

![Untitled](Intro/Untitled%202.png)

- More used one
- Hub = central node
- Robust
- Easy to fault identification

### Mesh

![Untitled](Intro/Untitled%203.png)

- Every machine is connected to all the others
- High fault tolerance and maintenance cost (N machine = N(N-1)/2 wires)

### Tree

![Untitled](Intro/Untitled%204.png)

- Hierarchical flow of data
- HUBs are necessary
- Adding nodes require modification of communication tables

# Data transfer mode

## Switching

- **Layer of operation :** operates at Layer 2 (Data Link Layer) of the OSI model. It primarily deals with Ethernet frames and MAC addresses. Switches are responsible for making forwarding decisions based on MAC addresses to determine where to send data within a local network (LAN).
- **Scope of operation :** is primarily used for local network traffic within the same LAN. It efficiently forwards data between devices in the same network segment.
- **Addressing:** relies on MAC addresses to identify devices on a local network. It uses the ARP (Address Resolution Protocol) to map IP addresses to MAC addresses within the local network.
- **Packet addressing :** frames are forwarded based on MAC addresses in a flat, non-hierarchical manner. Switches maintain MAC address tables to associate MAC addresses with specific ports on the switch.

## Routing

- **Layer of operation :** operates at Layer 3 (Network Layer) of the OSI model. It works with IP packets and uses IP addresses to determine the best path for data to travel across different networks, typically over a wide area network (WAN) or the internet.
- **Scope of operation :** is used to connect different networks together, whether those networks are local or remote. Routers make decisions about how to route data between networks, ensuring it reaches its destination across potentially multiple hops.
- **Addressing:** uses IP addresses to identify devices and networks. Routers maintain routing tables that contain information about the available paths to different IP subnets.
- **Packet addressing :** routers make decisions based on IP addresses and use routing protocols (e.g., OSPF, BGP) to determine the best path to reach the destination network. Routing involves more complex decision-making processes than simple MAC address-based forwarding.

## Data transmission modes

### Simplex mode

A speaks to B

### Half duplex mode

A and B speak together but **not at the same time**

### Full duplex mode

A and B speak together any time

## Data transmission methods

### Unicast

One send to one device

✅ **cross network**

### Broadcast

One send to all devices on the network

❌ **cross network**

### Multicast

One send to several devices

✅ **cross network**
