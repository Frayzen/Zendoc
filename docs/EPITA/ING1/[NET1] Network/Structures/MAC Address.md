---
title: "MAC Address"
---
Last edited time: October 26, 2023 2:47 PM

Mac address (6 bytes) used for LAN switching

# Composition

It is composed by two parts:

![Untitled](MAC%20Address/Untitled.png)

**ID of vendor:** Think of the ID of the vendor as the "Brand Name" of the network device. It's like the company name or logo on a product.

**Card Number:** The card number is like the "Serial Number" of the network device. It's unique to each individual device produced by a manufacturer.

## Example

![Untitled](MAC%20Address/Untitled%201.png)

# Type

MAC (Media Access Control) addresses come in three main types:

1. **Unicast MAC Address**:
    - **What it is**: Unicast MAC addresses are unique and specific to a single network interface (NIC) on a device. They are used for one-to-one communication between devices on a network.
    - **Example**: When one computer sends data to another computer on the same network, it uses the unicast MAC address of the recipient's NIC to ensure the data reaches the intended device.
        - *08 : 00 : 09 : 35 : d5 : 0b*
2. **Broadcast MAC Address**:
    - **What it is**: Broadcast MAC addresses are used for one-to-all communication. Data sent to a broadcast address is received by all devices on the same network segment.
    - **Example**: If a device sends data to the broadcast address, it's like making an announcement that everyone on the network can hear. Broadcasts are used for functions like network discovery and DHCP (Dynamic Host Configuration Protocol) requests.
        - All addresses bits are set to 1: *FF : FF : FF : FF : FF : FF*
3. **Multicast MAC Address**:
    - **What it is**: Multicast MAC addresses are used for one-to-many communication. Data sent to a multicast address is received by a select group of devices that have expressed interest in the data.
    - **Example**: In multimedia streaming or certain network services, multicast is used to send data to multiple devices that have joined a multicast group. Devices with matching group addresses receive the data.
        - Ipv6: 33 : 33 : xx : xx : xx : xx
        - Ipv4:
            - 01 : xx : xx : xx : xx : xx (*local*)
            - 01 : 00 : 5E : xx : xx : xx to 01 : 00 : 5E : 7F : FF : FF (*internet*)

These three types of MAC addresses help control how data is distributed on a network, whether it's intended for a single device (unicast), all devices (broadcast), or a specific group of devices (multicast).
