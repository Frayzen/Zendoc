---
title: 2) Liaison
Owner: "Florian "
---
Manage interface static addressing and access control
Responsible for routing data between nodes on the same local network  
◦ MAC addressing
Some protocols:  
◦ ETHERNET, PPP, HDLC, …
# Ethernet
Ethernet is the most used protocol of layer 2
- Ethernet handles [[Frame]] (sequence of bits)
- Simple to implement
- Ethernet transmission is not full duplex (stations are always listening)
# 802 Standards
The IEEE 802 organization cover the physical and data link layer specifications for technologies such as Ethernet and wireless
It has proposed a new architecture for layer 2 where **physical layer is divided in 2**
![[Untitled 164.png|Untitled 164.png]]
### LLC (Logical Link Control)
**LLC (Logical Link Control)** is like an air traffic controller for data traveling over a network. It helps manage the flow of data between devices to ensure they talk to each other properly.
1. **Traffic Control**: LLC makes sure that data packets are sent and received in the right order and that devices don't talk over each other.
2. **Addressing**: It uses addresses to direct data to the right devices on the network, just like addresses on letters.
3. **Error Checking**: It checks for mistakes in the data and asks for retransmission if something goes wrong, like asking for a do-over if you can't hear someone on the phone.
In simple terms, think of LLC as a **traffic cop** for data on the network, making sure it gets to the right place without accidents or mistakes.

> [!important] It is optional for 802.3 and 802.11
### MAC (Medium Access Control)
**MAC (Medium Access Control)** is like a bouncer at a nightclub for devices on a network. Its job is to control which device gets to use the network at any given time.
1. **Device Identification**: MAC assigns a unique "ID card" (address) to each device on the network, like giving everyone a different wristband at the club.
2. **Access Control**: It decides who gets to talk on the network and when. It ensures that devices take turns to prevent them from talking all at once, which could cause chaos.
3. **Orderly Communication**: MAC helps devices share the network "dance floor" by giving them specific time slots to talk. This ensures a smooth and orderly conversation, just like letting one person speak at a time during a meeting.
In a nutshell, MAC is the **network bouncer** that keeps things organized and prevents too much commotion among devices, so they can share the network without colliding or causing a mess.
# Devices
## Switch
- It divides a network into segments
    - Each segment become a collision domain
    - Each port is related to a collision domain
- It use packet switching to receive and forward data to the destination  
    device
- It improves network performance
    - Each collision domain has its own separate bandwidth
- It is able to inspect incoming traffic(frames) and decide whether to forward or drop it
    - Inspection is based on Mac address
### Commutation table (CAM)
A **Commutation Table** is responsible for efficiently directing network traffic, based on MAC (Media Access Control) addresses, and is used by switches to forward frames to their destination ports.
![[Untitled 1 111.png|Untitled 1 111.png]]
**Static CAM**: You write down in a book who's allowed to come to your party. You have control but need to update it if someone new joins the party.
1. **Manual Configuration**: In a Static CAM table, network administrators manually configure the entries in the CAM table. They specify which MAC addresses are associated with which network ports.
2. **Predictable**: Static CAM entries are fixed and do not change unless an administrator modifies them. This makes network management predictable and gives full control over the CAM table.
3. **Security**: Static CAM tables are more secure because they only allow devices with known MAC addresses to communicate on the network. Unwanted or unauthorized devices cannot easily join the network.
4. **Less Adaptive**: However, static CAM tables are less adaptable to changes in the network, such as when devices are added, removed, or replaced. Administrators must manually update the CAM table to accommodate these changes.
**Dynamic CAM**: You remember who comes to your party by looking at who's shown up. It's easy and adapts to new guests, but someone might sneak in if you're not careful.
1. **Automatic Learning**: In a Dynamic CAM table, the switch automatically learns MAC addresses by monitoring network traffic. When a device communicates through a network port, the switch notes the source MAC address and associates it with the port.
2. **Adaptive**: Dynamic CAM tables adapt to changes in the network without manual intervention. If a device is added or replaced, the switch will automatically learn and update its CAM table.
3. **Convenient**: This method is more convenient for managing larger or changing networks because it reduces the administrative burden.
4. **Potential Security Risks**: However, dynamic CAM tables can pose security risks if not properly managed. Unwanted devices can potentially access the network because the switch learns and stores new MAC addresses automatically.
## Channel allocation
- Channel allocation is an algorithm used to allow access to a shared network channel
- The network channel may be a single cable or optical fiber
- There can be multiple users
- A single channel is divided and allocated to multiple users
- Channel Allocation may be done using two  
    schemes
    - Static Channel Allocation
        - Assignement for long period
        - For LANs an MANs
    - Dynamic Channel Allocation
        
        - Stations continuously compete
        
          
        
# Address Resolution Protocol (ARP)
Used for discovering the link layer address associated with a given internet layer address
- Link layer address: MAC address,…
- Internet layer address: IPv4, …
It is a request-response protocol
![[Untitled 2 78.png|Untitled 2 78.png]]
**Scenario**: You have five devices (A, B, C, D, and E) connected to a switch in a small local network. Each device wants to communicate with another device by knowing their MAC address.
**ARP Process in a Simple Network**:
1. **Device A Wants to Communicate with Device B**:
    - Device A, wanting to send data to Device B, first checks if it knows Device B's MAC address. If it doesn't, it proceeds to the ARP process.
2. **ARP Request from Device A**:
    - Device A sends an ARP request (broadcast) to the local network, asking, "Who has the IP address of Device B?"
    - All devices on the local network, including B, receive this request.
3. **Device B Responds**:
    - Device B recognizes its IP address in the ARP request and responds directly to Device A with its MAC address.
    - This response is not broadcast; it goes only to Device A.
4. **Device A Now Knows Device B's MAC Address**:
    - With Device B's MAC address, Device A can address its data packet properly.
5. **Devices C, D, and E Observe the ARP Request**:
    - Even though Devices C, D, and E received the ARP request, they ignore it because it was specifically addressed to Device B, and they don't need to respond.
In this simple example, Device A uses ARP to discover the MAC address of Device B by broadcasting an ARP request. Device B, recognizing its IP address, responds with its MAC address, allowing Device A to communicate with it efficiently. The other devices (C, D, and E) simply observe the ARP request and don't respond because it's not intended for them.