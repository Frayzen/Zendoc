---
Owner: "Florian "
---
## Terminology
- **Wi-Fi**: Wireless networking technology (no official meaning for "Wireless Fidelity")
- **SSID**: Name of a Wi-Fi network
- **AP (Access Point)**: Device that allows Wi-Fi devices to connect to a network
- **WLAN**: Wireless Local Area Network
## WLAN Architecture
- Composed of multiple access points ("Bornes WiFi") connected via Ethernet/LAN
- Provides internet access to connected devices
## OSI Model & Wi-Fi
Wi-Fi operates at:
1. **Physical Layer** (Layer 1): Media, signal and binary transmission
2. **Data Link Layer** (Layer 2): Physical addressing (MAC addresses)
## Wi-Fi Standards Evolution
|   |   |   |   |   |
|---|---|---|---|---|
|Standard|Year|Frequency|Max Data Rate|Key Features|
|802.11b|1999|2.4 GHz|11 Mbps|First widely adopted|
|802.11a|1999|5 GHz|54 Mbps|Higher speed|
|802.11g|2003|2.4 GHz|54 Mbps|Combines a/b benefits|
|802.11n|2009|2.4/5 GHz|600 Mbps|MIMO, dual-band|
|802.11ac|2013|5 GHz|3.46 Gbps|VHT, Wave 1/2|
|802.11ax|2020|2.4/5/6 GHz|9.6 Gbps|WiFi 6, most recent|
## Key Technologies
- **MIMO** (Multiple Input Multiple Output): Uses multiple antennas for better performance
- **OFDM**: Orthogonal Frequency Division Multiplexing (used in modern standards)
- **DSSS/FHSS**: Older spread spectrum technologies (used in early Wi-Fi)
## Wi-Fi Channels
- 2.4 GHz band has 14 channels (22 MHz width each)
- Channels overlap (1, 6, 11 are non-overlapping in many regions)
## Addressing
- **MAC Address**: Unique hardware identifier (48-bit, e.g., `00:1A:2B:3C:4D:5E`)
- **IP Address**: Logical address assigned by network (unique per device on network)
## WLAN Architecture Types
1. **No NAT**: Modem in bridge mode (public IP directly on device)
2. **NAT**: Router assigns private IP addresses (common home setup)
## IoT Wi-Fi Chips
- **ESP8266** (2014): First low-cost Wi-Fi chip (~$2)
- **ESP32** (2017): Adds Bluetooth/BLE to Wi-Fi (~$5)
## Arduino Wi-Fi Programming
```C++
\#include <WiFi.h>
const char* ssid = "yourNetworkName";
const char* password = "yourNetworkPassword";
void setup() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  // Print connection info
  Serial.println(WiFi.localIP());
  Serial.println(WiFi.macAddress());
}
```
## Example Projects
1. **WiFiScan**: Scan available networks
2. **BasicHttpClient**: Make HTTP requests
3. **SimpleWiFiServer**: Create a basic web server
## Key Acronyms
- **SISO**: Single Input Single Output
- **MIMO**: Multiple Input Multiple Output
- **VHT**: Very High Throughput (802.11ac)
- **HT**: High Throughput (802.11n)
This sheet covers the essential concepts from the document for quick revision. Focus on the standards evolution, architecture, and programming examples for practical applications.