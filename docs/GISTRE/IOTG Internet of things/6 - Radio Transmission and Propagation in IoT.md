---
title: 6 - Radio Transmission and Propagation in IoT
Owner: "Florian "
---
## **Key Concepts**
### **1. Decibel (dB)**
- **Definition**: Logarithmic unit representing a ratio between two powers.
    - **Positive dB**: Gain (e.g., +3 dB = power multiplied by 2)
    - **Negative dB**: Attenuation (e.g., -10 dB = power divided by 10)
- **Formula**:_GdB_=10log(_PTPR_)
    
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
- **Conversion**:_PdBm_=10log(1mW_P_)
    
    PdBm=10log⁡(P1mW)
    
---
### **3. Key Metrics**
- **RSSI (Received Signal Strength Indication)**: Power of the received signal (PR_PR_).
- **Sensitivity**: Minimum RSSI required for successful signal reception.
- **SNR (Signal-to-Noise Ratio)**: Ratio of signal power to noise power.SNR_dB_=_PR_−_PN_
    
    SNRdB=PR−PN
    
---
### **4. Link Budget**
- **Definition**: Difference between transmitted power (PT_PT_) and receiver sensitivity.
- **Purpose**: Evaluates transmission potential (higher budget = longer distance).
- **Example**:Link Budget=_PT_−Sensitivity
    
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
    1. **RSSI Calculation**:_PR_=13dBm+2dBi−60dB+2dBi=−43dBm
        
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