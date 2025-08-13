---
Owner: "Florian "
---
## **Key Concepts**
### **1. Radio Technologies for IoT Applications**
- **Short-range** (<100m): WiFi, Bluetooth, Zigbee, Z-Wave, NFC, RFID
- **Long-range** (>1000m): 4G/5G, NB-IoT, Sigfox, LoRa, LTE-M
- **LPWAN** (Low Power Wide Area Network): LoRa, Sigfox, NB-IoT, LTE-M
### **2. Frequency Bands**
- **ISM Bands** (License-free):
    - 434 MHz, 863-870 MHz (Europe)
    - 2.4 GHz (global), 5.1-5.3 GHz, 24 GHz
- **Licensed Bands**: Used by cellular technologies (3G/4G/5G, NB-IoT, LTE-M)
### **3. Key Characteristics of IoT Technologies**
- **Data rate** (bps to Gbps)
- **Range** (cm to km)
- **Power consumption** (critical for battery-operated devices)
- **Coverage** (indoor/outdoor)
- **Cost** (modem and subscription)
### **4. Technology Comparison**
|   |   |   |   |   |   |
|---|---|---|---|---|---|
|**Technology**|**Data Rate**|**Range**|**Power Consumption**|**Topology**|**Use Case**|
|NFC|106-424 kbps|<10 cm|Very Low|P2P|Payments, access control|
|RFID|400 kbps|<3 m|Very Low|P2P|Item tracking|
|Bluetooth|1-700 kbps|<30 m|Low|Star, Mesh|Consumer electronics|
|BLE|1 Mbps|5-10 m|Very Low|Star|Health/fitness|
|WiFi|11 Mbps-1.3 Gbps|<100 m|High|Star|Internet, multimedia|
|Zigbee|250 kbps|10-300 m|Very Low|Mesh, Star|Home automation|
|Z-Wave|40 kbps|30 m|Very Low|Mesh|Residential automation|
|4G/5G|600 Mbps-1 Gbps|>3 km|High|Cellular|Mobile telephony|
|NB-IoT|250 kbps|>5 km|Medium|Cellular|Large-scale IoT|
|Sigfox|~800 bps|>10 km|Very Low|Cellular|Low-data applications|
|LoRa|250-5470 bps|>10 km|Very Low|Star, P2P|Long-range, low-power IoT|
### **5. LPWAN Technologies**
- **Sigfox**: Ultra Narrow Band, operator-managed, low cost (~1€/device/year)
- **LoRa**: Spread spectrum, can be operator-managed or private (e.g., The Things Network)
- **NB-IoT**: Cellular-based, supported by 3GPP, good for scaling
- **LTE-M**: Compatible with existing telecom networks, supports voice
### **6. Decision Tree for Technology Selection**
1. **Need long range (>1km)?**
    - Yes → Need high data rates? → Yes: Cellular (4G/5G); No: Consider power & cost → LoRa/Sigfox/NB-IoT
    - No → Need >10 Mbps? → Yes: WiFi; No: Consider power → BLE/Zigbee/Z-Wave
### **7. Application Examples**
- **Smart Watch**: Likely uses BLE for smartphone connection
- **Smart Agriculture**: Uses LoRa for long-range sensor networks
- **Industrial Sensors**: May use Zigbee or WirelessHART for mesh networks
## **Key Takeaways**
- Short-range technologies excel in power efficiency for personal/indoor use
- LPWAN enables battery-operated devices with multi-year lifespan
- Cellular IoT (NB-IoT, LTE-M) offers good compromise between range and data rate
- Choice depends on range, data rate, power, and cost requirements