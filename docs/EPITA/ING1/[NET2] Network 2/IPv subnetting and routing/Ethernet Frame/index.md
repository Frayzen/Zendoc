---
title: "Ethernet Frame"
---
Last edited time: May 28, 2024 3:39 AM

# Overview

The data sent over a network needs to be ordered in order for the communication to happen correctly. Therefore, the **Ethernet frame** represents the basic unit of transmitted data. A single frame is rarely enough to send complex information. We subdivide the initial data in as many frame as needed.

![Untitled](Ethernet%20Frame/Untitled.png)

- There are 7 bytes of preambles (*10101010 repeated 7 times*), then one byte of Start Frame Delimiter (*10101011*).
- MAC Addresses: each computer is represent by a unique address called a mac address. It is a unique identifier associated with each physical interface. The MAC address is provided by the brand that built the physical device and cannot be changed by the PC user.
    
    <aside>
    ⚠️  This address is to differ from the IP
    
    </aside>
    
- The Ethertype indicates which protocol is encapsulated in the payload of the frame. It will be used to determine how to interpret the data portion of the Ethernet frame.
    - Here are few types
        - **0x0800**: IPv4
        - **0x86DD**: IPv6
        - **0x0806**: ARP (Address Resolution Protocol)
        - **0x8100**: VLAN-tagged frame (IEEE 802.1Q)
        - **0x8847**: MPLS unicast
        - **0x8848**: MPLS multicast
    
    <aside>
    🧠 Layer 2 devices (switches) do not look into the payload (nor the ethertype).
    
    </aside>
    
- There is an InterPacket Gap of 12 bytes after each frame. The IPG is a short period of idle time between successive packets on an Ethernet network. It ensures proper timing andsynchronization between frames, allowing network devices to process and prepare for the next frame.
- [The payload is described here](Payload.md)
