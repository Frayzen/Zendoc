---
title: 1 Physical
---
Last edited time: October 26, 2023 3:23 PM

# Definition

Manage wired or wireless link

Conversion of bits into electrical or optical signals

# Ethernet physical layer

![](https://images.unsplash.com/photo-1574405345169-f45c7d66480e?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb)

- Speed from 1Mbit/s to 400 Gbits/s
- Maximum distances
◦ 100 m over twisted pair
◦ Up 100 km over optical pair

## Notation

![Untitled](1%20Physical/Untitled.png)

### Speed

“10” denotes the data transmission speed

(*No suffix = mega bits/s ; G = gigabits/s*)

### Length

"5" denotes the maximum segment length, which is 500 meters. This means that the cable segment should not exceed this length to ensure proper signal transmission.

### Characteristic of signal

BASE= Baseband
BROAD= Broadband
PASS= Passband

- **Baseband** is about transmitting a single signal over the entire available bandwidth.
- **Broadband** involves dividing the available bandwidth into multiple channels for concurrent transmission of different signals.
- **Passband** is a frequency range within which signals are allowed to pass through a filter or communication system.

# Network Card (NIC)

![Untitled](1%20Physical/Untitled%201.png)

It is a computer hardware component that connect a computer to a computer network
◦ Through cable or in wireless mode

It implements the electronic circuitry required to communicate using a specific physical layer and data link layer standard such as Ethernet or Wi-Fi
It is identified by:
◦ A MAC address
◦ An IP address

<aside>
👁️‍🗨️ Getting network card informations
◦ Windows: ipconfig /all
◦ Linux : ip link

</aside>

# Channel allocation

![Untitled](1%20Physical/Untitled%202.png)

FDM (Frequency Division Multiplexing)

- frequency channel is divided into N equal sized portions (bandwidth) if there are N users
- each frequency is private! there is no interference between users

<aside>
👀 See [Channel Allocation Liaison](2)%20Liaison.md)

</aside>

# Network devices

## Network HUB (repeater)

It a layer 1 device with multiple Ethernet ports
◦ network hardware device for connecting multiple Ethernet devices together
◦ Allow to connect Ethernet devices on a single network segment
◦ Is well-suited for LAN network
◦ It doesn’t have routing capabilities

### Behavior

- Received data at one port are transmitted to all of its other ports without restriction
- All devices connected to a network hub share all available bandwidth equally

<aside>
⚠️ No separation of collision domains since **no routing**

</aside>

Hub uses [Half-duplex](../Intro.md) transmission mode

### Downsides

Hubs are obsolete

The [broadcast mode](../Intro.md) can transmit messages in the network too
