---
title: Frame
Owner: "Florian "
---
A network frame is made up of several components, including a header, payload, and trailer. These components are organized in a specific structure that allows devices on a network to transmit and receive data efficiently.
![[Untitled 145.png|Untitled 145.png]]

# Header
![[Untitled 1 98.png|Untitled 1 98.png]]

- Preamble (7 bytes)
    - Known sequence of bits (_10101010 10101010 10101010 10101010 10101010 10101010 10101010 10101011_)
- SFD (1 byte)
    - It marks the end of the preamble and the beginning of Ethernet frame
    - Always 1
- Dest Mac Address (6 bytes)
- Source Mac Address (6 bytes)
- Ether type (2 bytes):
    - Type of upper layer protocol
|Type|Data|
|---|---|
|0800|IP|
|0806|ARP|
|0835|RARP|
|6000|DEC|
|6009|DEC|
|8019|DOMAIN|
# Payload
Frames has a between 72 and 1526 bytes

> [!important] padding is used to enlarge small frames
1. **Version**: This field indicates the version of the IP protocol in use (e.g., IPv4 or IPv6).
2. **Header Length**: The header length field specifies the length of the IP header in 32-bit words. It is used to determine where the header ends and where the payload begins.
3. **ToS (Type of Service)**: The ToS field is used for specifying the Quality of Service (QoS) and differentiated services for the IP packet, which can affect how it is handled by routers and network devices.
4. **Total Length**: This field specifies the total length of the IP packet, including both the header and the payload.
5. **Header Checksum**: The header checksum field contains a checksum value used for error-checking the header itself. It helps ensure the integrity of the header during transmission.
# Trailer