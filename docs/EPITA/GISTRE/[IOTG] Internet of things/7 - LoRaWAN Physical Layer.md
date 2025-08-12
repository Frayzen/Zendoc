---
title: "7 - LoRaWAN Physical Layer"
---
Last edited time: June 19, 2025 9:48 PM

### **1. LoRa Modulation Basics**

- **LoRa** = Long Range, Low Speed protocol
- Operates in **868 MHz band** (EU)
- Uses **Chirp Spread Spectrum (CSS)** modulation
- Different devices can transmit simultaneously using different **Spreading Factors (SF)**

### **2. Spreading Factors (SF)**

- Range: SF5 to SF12 (SF7-SF12 typically used in LoRaWAN)
- Higher SF = longer range but lower data rate
- Devices with different SF can share same frequency channel

### **3. Bit Rate Calculation**

text

Copy

Download

```
Bit Rate = SF × (Bandwidth / 2^SF)
```

- Example for SF7, 125 kHz:
    - 7 × (125,000 / 128) = 6,836 bps
- Example for SF12, 125 kHz:
    - 12 × (125,000 / 4096) = 366 bps

### **4. Coding Rate (Error Correction)**

| **CR** | **Coding Scheme** | **Overhead** |
| --- | --- | --- |
| 1 | 4/5 | 1.25× |
| 2 | 4/6 | 1.5× |
| 3 | 4/7 | 1.75× |
| 4 | 4/8 | 2× |

### **5. Time-on-Air (ToA)**

- Actual transmission time including preamble and headers
- Real bit rate = Payload size / Total frame time
- Symbol duration formula:CopyDownload
    
    text
    
    ```
    T_symbol = (2^SF) / Bandwidth
    ```
    

### **6. LoRa Frame Structure**

text

Copy

Download

```
[Preamble] [Header] [Payload] [CRC]
```

- LoRaWAN adds additional header fields

### **7. Multiplexing Techniques**

- **Frequency Division**: Different devices use different frequency channels
- **Time Division**: Devices share same channel by transmitting at different times
- **Spread Spectrum**: Different SF allows channel sharing

### **8. Duty Cycle (EU868)**

- Limited to 1% (or 1/100) of transmission time
- Significantly reduces effective data rate
- Example: 172.7 bps → 1.73 bps after duty cycle

### **9. Energy Consumption Factors**

- Time-on-Air (most significant)
- Collisions and retransmissions
- Duty cycle limitations
- Transmission power
- Low power mode efficiency

## **Practical Tools**

- LoRa Air Time Calculator: [loratools.nl](https://loratools.nl/#/airtime)
- LoRaWAN Air Time Calculator: [The Things Network](https://www.thethingsnetwork.org/airtime-calculator)
- Energy Calculator: [DRAMCO](https://dramco.be/tools/lora-calculator/)

## **Key Equations**

1. Symbol duration:CopyDownload
    
    text
    
    ```
    T_symbol = (2^SF)/BW
    ```
    
2. Bit rate:CopyDownload
    
    text
    
    ```
    Bit Rate = SF × (BW/2^SF)
    ```
    
3. Effective bit rate (considering coding rate):CopyDownload
    
    text
    
    ```
    Effective BR = Nominal BR / Overhead Ratio
    ```
    

## **Performance Trade-offs**

- Higher SF → Longer range but lower data rate
- Higher coding rate → Better error correction but lower effective data rate
- Wider bandwidth → Higher data rate but potentially shorter range
