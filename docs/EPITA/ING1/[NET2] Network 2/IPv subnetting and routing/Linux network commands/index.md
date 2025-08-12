---
title: "Linux network commands"
---
Last edited time: May 28, 2024 5:16 AM

## Look your addresses up 👀

The linux “ip link” command is a great tool to show useful information about your interfaces (virtual **and** physical).

```bash
ip link # or ip l
```

<aside>
🧠 You might encounter the **lo** interface. It stands for “*loopback*”. It is a dummy interfaceip

</aside>

Here is an explanation of the output of the command:

![Untitled](MAC%20Address/Untitled.png)

- MTU stands for Maximum Transmission Unit, and it refers to the largest size of a packet or frame, in bytes, that can be sent in a single network layer transaction.
- Status can be of several types. It provides information about the relation between the computer and the physical interface.
    - Here is the list of all the possible status
        1. **UP**: The interface is administratively up and can pass traffic. This means the interface is enabled and operational.
        2. **DOWN**: The interface is administratively down and cannot pass traffic. This usually means the interface has been manually disabled.
        3. **UNKNOWN**: The state of the interface cannot be determined. This might occur if the interface is in a transitional state or if there is a problem with the interface.
        4. **LOWER_UP**: The physical layer of the interface is up, indicating that the physical link is established. This doesn't necessarily mean that the interface is able to pass traffic, but it indicates that the physical connection is active.
        5. **DORMANT**: The interface is administratively up, but the physical layer is down. This usually occurs when the interface is in a low-power state or when there is no physical connection.
        6. **NOTPRESENT**: The physical interface is not present or not detected by the system. This can happen if the interface hardware is not properly installed or if there is a hardware failure.
        7. **LOWER_DOWN**: The physical layer of the interface is down, indicating that the physical link is not established. This typically occurs when there is a problem with the physical connection, such as a cable unplugged or a hardware failure.
- The term "qlen" typically refers to "queue length" in the context of networking. Queue length is an important metric that indicates the number of packets or data frames waiting in a queue to be transmitted over a network interface.

## Look up my IP 👀

The linux “ip address” command is a great tool to show useful information about the ip of your interfaces (virtual **and** physical).

```bash
ip address # or ip a
```

![Untitled](IPv4%20protocol/Untitled.png)

<aside>
💡 A machine could have more than one IP, even on the same interface

</aside>

## Look up my route Table 👀

The linux “ip address” command is a great tool to show useful information about the route table of your computer. It allows a linux-based computer to act like a [router](Devices.md).

```bash
ip route # or ip r
```

<aside>
🧠 The route table is related to your computer, not a physical device

</aside>

![Untitled](Linux%20network%20commands/Untitled.png)
