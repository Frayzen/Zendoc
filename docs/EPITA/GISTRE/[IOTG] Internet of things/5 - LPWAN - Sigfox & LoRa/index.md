---
title: "5 - LPWAN - Sigfox & LoRa"
---
Last edited time: June 19, 2025 9:46 PM

## **1. Overview**

- **LPWAN (Low Power Wide Area Network):** Designed for IoT devices requiring long-range communication with minimal power consumption.
- **Key Features:**
    - Low power consumption (devices can sleep for months).
    - Long-range coverage (up to 60km for Sigfox, 15km for LoRa).
    - Uses ISM bands (free but regulated frequencies).
    - Asymmetric (Sigfox) vs. symmetric (LoRa) communication.

---

## **2. Sigfox**

### **Basics**

- **Origin:** Created in Toulouse, France (2009). Acquired by Unabiz in 2022.
- **Coverage:** 72 countries (as of 2020), single global network.
- **Key Features:**
    - **Ultra Narrow Band (UNB):** Transmits on very narrow frequencies to maximize signal power.
    - **Asymmetric:** Simple transmission, complex reception (Software Defined Radio).
    - **Payload:** Fixed 12-byte frames.
    - **Downlink:** Limited to 4/day, bi-directional.

### **Technical Specifications**

- **Frequency Bands:**
    - Europe: 868MHz (200KHz bandwidth, 2000 channels of 100Hz each).
    - Americas/Asia: 902-920MHz.
- **Regulation:** Duty cycle limits (1% in Europe).
- **Security:** Message signing (EAS), optional AES-CTR encryption, anti-jamming.

### **Advantages**

- Global network, low device cost ($0.20–$1.50 per device).
- High reliability (99.99% deliverability via message replication).

---

## **3. LoRa & LoRaWAN**

### **Basics**

- **Origin:** Created in Grenoble, France (2009). Acquired by Semtech (2012).
- **LoRa:** Physical layer (radio modulation).
- **LoRaWAN:** Network protocol (managed by LoRa Alliance).

### **Key Features**

- **Spread Spectrum:** Signals spread over multiple frequencies to avoid noise.
- **Symmetric:** Similar complexity for transmission/reception.
- **Payload:** Variable (59–250 bytes depending on Spread Factor).
- **Downlink:** Immediate after uplink, supports firmware updates.

### **Technical Specifications**

- **Frequency Bands:**
    - Europe: 868MHz (125KHz channels).
    - Americas/Asia: 902-920MHz.
- **Regulation:** Duty cycle (1% in Europe), channel hopping in FCC zones.
- **Spread Factor (SF):** Trade-off between range and speed (SF12 = slowest/longest range).

### **Advantages**

- Supports private networks (e.g., The Things Network, Helium).
- Better throughput than Sigfox (250bps–11kbps).

---

## **4. Comparison: Sigfox vs. LoRaWAN**

| **Feature** | **Sigfox** | **LoRaWAN** |
| --- | --- | --- |
| **Network Type** | Global, single operator | Multiple operators/private nets |
| **Modulation** | Ultra Narrow Band (UNB) | Spread Spectrum (LoRa) |
| **Payload Size** | Fixed (12 bytes) | Variable (59–250 bytes) |
| **Downlink** | Limited (4/day) | Flexible (after uplink) |
| **Security** | EAS signing, optional encryption | Mandatory encryption |
| **Cost per Device** | $0.20–$1.50 | ~$5+ |

---

## **5. Use Cases**

- **Sigfox:** Asset tracking, security (ATLAS for GPS-free localization).
- **LoRaWAN:** Smart cities, agriculture, industrial IoT (e.g., sensor networks).

---

## **6. Regulatory Notes**

- **ISM Band Rules (Europe):**
    - Uplink: 1% duty cycle (25mW max).
    - Downlink: 10% duty cycle (500mW max for Sigfox).

---

## **7. Crowdsourced Networks**

- **The Things Network (TTN):** Free, open-source LoRaWAN (15,900 gateways globally).
- **Helium:** Blockchain-based, incentivized deployment (934K hotspots).

---

## **8. 3GPP Alternatives (NB-IoT/LTE-M)**

- Use licensed spectrum (no duty cycle limits).
- Higher throughput but require cellular infrastructure.

---

### **Key Takeaways**

- **Sigfox:** Simpler, global, low-cost, but limited payload.
- **LoRaWAN:** Flexible, scalable, supports private networks, higher complexity.
- **Choice depends on:** Coverage needs, data requirements, budget.

**Sources:** Disk91 Blog, Sigfox/LoRa Alliance Docs, ERC-REC-70-03E Regulation.
