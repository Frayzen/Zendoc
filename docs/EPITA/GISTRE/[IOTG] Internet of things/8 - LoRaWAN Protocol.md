---
title: "8 - LoRaWAN Protocol"
---
Last edited time: June 19, 2025 9:50 PM

## **1. LoRa vs LoRaWAN**

- **LoRa**: Physical layer modulation (Chirp Spread Spectrum)
- **LoRaWAN**: MAC layer protocol built on top of LoRa (network architecture, security, device management)

## **2. LoRaWAN Network Infrastructure**

- **Components**:
    - End Devices (Nodes)
    - Gateways (forward messages between devices and network server)
    - Network Server (manages network, handles security)
    - Application Server (processes application data)

## **3. Security Features**

- **Confidentiality**: Encryption using keys (AppSKey for payload, NwkSKey for control)
- **Integrity**: Message integrity checks
- **Authenticity**: Device authentication

## **4. Device Classes**

| **Class** | **Description** | **Power Consumption** | **Downlink Capability** |
| --- | --- | --- | --- |
| A | Default, battery optimized | Lowest | Only after uplink (RX1/RX2 windows) |
| B | Scheduled receive slots | Medium | Additional periodic receive slots |
| C | Always listening | Highest | Continuous downlink capability |

## **5. Activation Methods**

| **Method** | **Description** | **Advantages** | **Disadvantages** |
| --- | --- | --- | --- |
| ABP (Activation By Personalization) | Pre-programmed keys (DevAddr, NwkSKey, AppSKey) | Simple activation | Less secure, harder to change networks |
| OTAA (Over-The-Air Activation) | Dynamic key generation via Join procedure | More secure, flexible | More complex implementation |

## **6. Security Considerations**

- **Replay Attack Prevention**:
    - Frame counters (valid only if X ≥ Y)
    - OTAA preferred over ABP
    - Store frame counters in non-volatile memory
- **Key Management**:
    - ABP: Store NwkSKey and AppSKey securely
    - OTAA: Store AppKey securely

## **7. Network Parameters**

- **RX Delay**: Time between uplink and first downlink window (typically 1-15s)
- **CFList**: Channel frequency list for additional channels
- **ADR (Adaptive Data Rate)**: Automatically adjusts:
    - Spreading Factor (SF7-SF12)
    - Transmission power
    - Based on link quality (SNR, RSSI)

## **8. Technical Parameters**

- **Frequency Bands**: 868MHz (EU), 915MHz (US), etc.
- **Data Rates**: DR0 (SF12) to DR6 (SF7 @ 250kHz)
- **TX Power**: 2dBm to 14dBm (EU)

## **Key Takeaways**

- LoRaWAN enables long-range, low-power IoT communications
- Security is built-in with encryption and authentication
- Device classes allow trade-offs between power and responsiveness
- OTAA provides more flexibility and security than ABP
- ADR optimizes network performance and battery life
