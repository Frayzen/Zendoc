---
title: "6 - Radio Transmission and Propagation in IoT"
---
Last edited time: June 19, 2025 9:46 PM

## **Key Concepts**

### **1. Decibel (dB)**

- **Definition**: Logarithmic unit representing a ratio between two powers.
    - **Positive dB**: Gain (e.g., +3 dB = power multiplied by 2)
    - **Negative dB**: Attenuation (e.g., -10 dB = power divided by 10)
- **Formula**:*GdB*=10log(*PTPR*)
    
    GdB=10log⁡(PRPT)
    
- **Examples**:
    - 10 dB → Power ×10
    - 3 dB → Power ÷2

---

### **2. dBm**

- **Definition**: Power level relative to 1 milliwatt (mW).
- **Examples**:
    - 0 dBm = 1 mW
    - 10 dBm = 10 mW
    - 10 dBm = 0.1 mW
- **Conversion**:*PdBm*=10log(1mW*P*)
    
    PdBm=10log⁡(P1mW)
    

---

### **3. Key Metrics**

- **RSSI (Received Signal Strength Indication)**: Power of the received signal (PR*PR*).
- **Sensitivity**: Minimum RSSI required for successful signal reception.
- **SNR (Signal-to-Noise Ratio)**: Ratio of signal power to noise power.SNR*dB*=*PR*−*PN*
    
    SNRdB=PR−PN
    

---

### **4. Link Budget**

- **Definition**: Difference between transmitted power (PT*PT*) and receiver sensitivity.
- **Purpose**: Evaluates transmission potential (higher budget = longer distance).
- **Example**:Link Budget=*PT*−Sensitivity
    
    Link Budget=PT−Sensitivity
    
    - LTE (4G): ~130 dB
    - LoRa: ~157 dB

---

## **Example Problems**

### **Example 1:**

- **Given**:
    - Transmitter: 13dBm13dBm, antenna gain 2dBi2dBi, air loss 60dB60dB.
    - Receiver: Antenna gain 2dBi2dBi, sensitivity −80dBm−80dBm.
- **Solution**:
    1. **RSSI Calculation**:*PR*=13dBm+2dBi−60dB+2dBi=−43dBm
        
        PR=13dBm+2dBi−60dB+2dBi=−43dBm
        
        Since −43dBm>−80dBm−43dBm>−80dBm, signal is received.
        
    2. **SNR Calculation** (noise = −50dBm−50dBm):SNR=−43dBm−(−50dBm)=7dB
        
        SNR=−43dBm−(−50dBm)=7dB
        

### **Example 2:**

- **Link Budget Calculation**:13dBm−(−80dBm)=93dB
    
    13dBm−(−80dBm)=93dB
    

---

## **Summary**

- **Decibel (dB/dBm)**: Express ratios or absolute power.
- **RSSI > Sensitivity**: Ensures successful transmission.
- **Link Budget**: Determines maximum transmission distance.
- **SNR**: Higher SNR improves signal quality.

---

**Tip**: For exams, practice converting between dB, dBm, and linear scales, and calculate link budgets for given scenarios.
