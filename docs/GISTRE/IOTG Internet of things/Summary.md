---
Owner: "Florian "
---
# C1: Introduction
- **IoT (Internet of Things)** is revolutionizing industries by changing how processes are executed.
- Became a reality between 2008 and 2009 due to the number of connected devices exceeding the world’s population.
---
## IoT as a Solution
- IoT solutions are based on data collected directly from the physical world by “things.”
- This data is used for telemetry (transmitting data) and commands (controlling devices).
### Three Layers of an IoT Solution:
1. **Devices (Sensors & Actuators):**
    - Capture data from the physical world.
    - Numerous devices enhance the value created by the platform.
2. **Platform:**
    - Makes data meaningful and accessible to the end-user.
    - Processes large datasets.
    - Mixes different sources of data.
    - Creates individual and aggregated value.
    - Manages the device fleet.
3. **Communication:**
    - Transmits captured data autonomously from the field to consumers.
    - Prioritizes energy efficiency over speed.
---
## Applications of IoT
- **Embedded Systems:** Agriculture automation.
- **Mobile Devices:** Everyday things for smarter living.
- **Sensor Networks:** M2M (Machine to Machine) wireless communication.
- **Building Management:** Security & Surveillance.
- **Smart Homes & Cities:** Creating intelligent environments.
- **Vehicle, Asset, Person & Pet Monitoring & Controlling:** Tracking and managing assets.
- **Telemedicine & Healthcare:** Remote health monitoring and care.
---
## Use Cases
### FITBIT
- Collects personal activity & health data from millions of users.
- Processes data to propose individual feedback and global data studies.
- Uses Bluetooth and customer smartphones as a gateway to the internet.
- Utilizes app and big data for customer experience and B2B services.
### NETATMO
- Gathers home environmental information (temperature, humidity, sound).
- Offers individual feedback and global data studies.
- Uses Wi-Fi and customer internet connectivity to reach backend services.
- Employs app and big data to provide customer experience and city maps of environmental noise.
### INVOXIA
- Collects GPS position data.
- Uses LPWAN (Low Power Wide Area Network) for communication.
- Provides GPS trackers for cars, bikes, pets, etc.
---
## IoT Revenue Models
- Based on high-value insights.
- The user shares data to obtain a personal benefit.
- Massive data aggregation allows custom studies.
- Recurring incomes increase with more data points.
---
## Key Takeaways about IoT
- Solution composed of Hardware, Network, and Software.
- Requires maintenance, with business models based on services.
- Relies on multiple technologies.
- The communication layer varies based on context.
- Value is derived from direct benefits for end-users and B2B revenue from mass data collection.
---
## IoT as an Enabler
- Disruptive business models and services boosted by Cloud, Mobile, Social & Big Data.
- Connected Cars, M2M, Connected Silicon, Smarter Cities.
- Deep industry transformation from products to services (e.g., Spotify, Netflix, Uber).
### Data Growth
- Expected to exceed 160 zettabytes by 2025.
- Data is considered the “oil of the 21st century.”
### Data Economy vs. Oil Economy
- Highlights the shift from traditional oil & gas companies to data-driven tech companies in terms of market value.
---
## Cloud Platforms
- **IaaS (Infrastructure as a Service)**
- **PaaS (Platform as a Service)**
### Key Players
- AWS (Amazon Web Services)
- Microsoft Azure
- Google Cloud Platform
- Tencent Cloud
- Alibaba Cloud
- IBM Cloud
- OVH Cloud
- Ubidots
---
## Innovation in IoT
- Adding connectivity to existing things doesn’t automatically create innovation.
- Innovation transforms existing markets or creates new ones.
### Applications of IoT
- Fight against counterfeiting
- Understand the use of product
- Track product in distribution circuit
- Propose maintenance based on use
- Per use billing
- Propose renewal right on time
- Allow opening Unlock special blade
---
## Forecasting with IoT
- IoT can give them a real time view of the distribution stocks and move away from forecast to real-time market data.
---
## Scale of IoT
- **Internet (2004):** 800 million users
- **Internet (2014):** 3 billion users
- **Mobile (2006):** 2.6 billion users
- **Mobile (2016):** 7.4 billion users
- **IoT (2015):** 6 billion devices
- **IoT (2025):** 27 billion devices
---
## IoT at Scale
- Distinguishes itself through the ability to deploy millions of devices in the field.
- Characterized by ultra-low-cost devices.
---
## IoT as a Source of Physical World AI
- Captures environmental data to feed AI.
- Enables new AI capabilities like car driving, industrial maintenance, pollution control, etc.
---
# C2: Technologies IoT
- Introduction to the technologies behind the Internet of Things.
---
## Radio Technologies for IoT Applications
- **WiFi**
- **Bluetooth**
- **Zigbee, Zwave, 6lowpan**
- **3G, 4G, 5G**
- **LPWAN (LoRa, Sigfox, LTE-M, NB-IoT)**
- **NFC, RFID**
---
## Frequency Bands
- Spectrum allocation (licensed vs. unlicensed).
---
## ISM Frequency Bands
- **ISM (Industrial, Scientific, and Medical) bands:** License-free bands used by many IoT technologies.
    - 434 MHz
    - 863-870 MHz
    - 2.4 GHz
    - 5.1-5.3 GHz
- Power limits vary based on the frequency and region.
---
## Key Characteristics to Consider When Choosing a Technology
- **Data Rate and Quantity:** The amount of data that needs to be sent.
- **Communication Range:** The distance over which the data needs to be transmitted.
- **Energy Consumption:** The power required for the device to operate.
- **Coverage:** The area in which the device needs to operate.
- **Subscription Cost:** The cost of subscribing to a network.
- **Modem Cost:** The cost of the modem for the device.
---
## Trade-offs
- Data rate, range, and energy consumption.
---
## Technology Categories
- **Short-Range Technologies:** WiFi, Bluetooth, Zigbee, NFC, RFID.
    - Range less than 100 m.
    - Consumer Electronics.
    - Point-to-point information exchange or access authorization (RFID, NFC, Bluetooth).
    - Home automation (ZigBee, ZWave).
    - Connected objects (Bluetooth, WiFi).
- **Long-Range Technologies:** 4G, NB-IoT, Sigfox, LORA.
    - Range greater than 1000 m.
    - Mobile telephony and derivatives (SMS, mobile applications).
    - IoT data collection.
---
## Mapping of Wireless Technologies in IoT
- Low Power Wide Area (LPWA) technologies.
- Cellular technologies (2G, 3G, 4G).
---
## LPWAN Technologies
- **Lora**
- **NB-IoT**
- **Sigfox**
### Strategic Positioning
- **Sigfox:**
    - Non-licensed (868 MHz).
    - Operates a global network.
    - Business model: selling subscriptions.
    - Ultra Narrow Band technology.
    - Scale-up possible.
- **LORA:**
    - Non-licensed (868 MHz).
    - Semtech manufactures LORA radio modules.
    - Business model: selling hardware.
    - Spread spectrum technology.
    - Deployed by telecom companies.
- **LTE-M:**
    - Licensed.
    - Compatible with current telecom networks (2G, 3G, 4G, 5G).
    - Supports voice communication.
    - Supported by 3GPP.
- **NB-IoT:**
    - Licensed.
    - Ultra Narrow Band technology.
    - Supported by 3GPP.
    - New modem required on base stations.
    - Scale-up possible.
---
## Comparative Synthesis
- Technology consumption, data rate, range, and infrastructure.
- **RFID/NFC:** Short range, very low power.
- **Wi-Fi:** High data rate, medium range, high power.
- **Bluetooth:** Medium data rate, short range, medium power.
- **Zigbee:** Low data rate, short range, low power.
- **4G:** High data rate, long range, high power.
- **NB-IoT:** Low data rate, long range, low power.
- **Sigfox:** Very low data rate, long range, very low power.
- **LoRa:** Low data rate, long range, low power.
---
## Technology Selection Guide
- Distance, data rate, energy consumption, and coverage.
---
## Application Example
- Connected Watch (Bluetooth).
---
## Sensor Network Example
- Devices (sensors & actuators), gateway, LoRaWAN server, users.
---
# C3: Wi-Fi
- Introduction to Wi-Fi technology.
---
## Terminology
- **Wi-Fi:** Wireless Fidelity.
- **SSID:** Name of a Wi-Fi network.
- **AP:** Access Point.
- **WLAN:** Wireless LAN.
---
## WLAN Architecture
- Access points connected to the internet via Ethernet.
---
## Wi-Fi and the OSI Model
- Wi-Fi operates at layers one and two (Physical and Data Link).
---
## Wi-Fi Standards
- Evolution of Wi-Fi standards over time.
- **802.11a:** 54 Mbps (1999)
- **802.11n:** 600 Mbps (2009)
- **802.11ac:** 1.73 Gbps (2013)
- **802.11ac:** 3.46 Gbps (2015)
- **802.11ax:** 9.60 Gbps (2020)
---
## Key Parameters
- Frequency
- Maximum data rate
---
## SISO and MIMO
- **SISO (Single Input, Single Output):** Single transmitter, single receiver.
- **MIMO (Multiple Input, Multiple Output):** Multiple transmitters, multiple receivers.
---
## Wi-Fi Channels
- Channel frequency and allocation in the 2.4 GHz band.
---
## MAC Address, IP Address
- Each Wi-Fi chip has a unique MAC address.
- The network assigns an IP address to each device.
---
## WLAN Architecture
- Private vs Public IP address.
- ESP8266 : First low cost Wi-Fi Chip (2014)
- NodeMCU (ESP8266 Chip) : 2015
---
## ESP32
- BLE (Bluetooth Low Energy) and Wi-Fi capabilities.
---
## Arduino WiFi Library
- Code example for connecting to a Wi-Fi network.
---
## Examples
- Scanning access points.
- Basic HTTP client.
- Simple Wi-Fi server.
---
# C4: TCP/IP Protocols - HTTP, MQTT, CoAP
- Overview of communication protocols for IoT.
---
## Wi-Fi and Cloud Connectivity
- Choosing between HTTP REST, MQTT, or CoAP when connecting devices to the cloud.
---
## Data Formats
- **JSON (JavaScript Object Notation):**
    
    ```JSON
    {    "name":"John",    "age":30,    "car": "Ford"}
    ```
    
- **XML (Extensible Markup Language):**
    
    ```XML
    <?xml version="1.0" encoding="UTF-8" standalone="yes" ?><repertoire>
        <personne>Robert</personne>
        <personne>John</personne>
    </repertoire>
    ```
    
---
## Client/Server vs. Publish/Subscribe
- HTTP REST (Client/Server)
- MQTT (Publish/Subscribe)
---
## HTTP RESTful API
- **REST (Representational State Transfer):**
    - Architecture style for distributed hypermedia systems.
    - Created by Roy Fielding in 2000.
    - Based on HTTP, using methods like GET, PUT, POST, DELETE.
    - Disadvantage: Verbose, consuming more bandwidth.
---
## HTTP: Client-Server Principle
- Client-Server with POST requests (uplink)
- Client-Server with GET requests (downlink)
---
## REST Example with Microsoft Azure
- Sending data with JSON.
---
## REST Responses
- **2.xx:** Success.
- **4.xx:** Client Error.
- **5.xx:** Internal Server Error.
---
## MQTT (Message Queue Telemetry Transport)
- Open: Created by IBM & Eurotech.
- Lightweight: Smallest packet size is 2 bytes.
- Reliable: Three Quality of Service (QoS) levels.
- Simple:
    - TCP based
    - Asynchronous
    - Publish/Subscribe architecture
    - Few verbs
    - Payload agnostic
---
## MQTT Communication
- Publisher, Broker, and Subscriber model.
---
## MQTT: The Publisher-Broker-Subscriber Principle
- Broker receives subscriptions from clients on topics.
- Broker receives messages and forwards them.
- Clients subscribe/publish on topics.
---
## MQTT: The Topics
- Topic structure (e.g., house/room/temp).
---
## MQTT: Demonstration with Mosquitto
---
## MQTT: Quality of Service (QoS)
- **QoS 0:** At most once (fire and forget).
- **QoS 1:** At least once (message recorded, possible duplications).
- **QoS 2:** Exactly once (message recorded, no duplication).
---
## MQTT Security
- Over TCP, use SSL/TLS.
---
## MQTT Header
- Byte 1: Message Type and Flags (DUP, QoS level, RETAIN).
- Byte 2: Remaining Length.
---
## HTTP vs MQTT
### HTTP
- Just two bytes in size
- Typically not small
### MQTT
- Is text-based service (100KB)
- XML
---
## MQTT: Demonstration with Mosquitto and ESP32
---
## CoAP (Constrained Application Protocol)
- Designed by the Constrained RESTful Environments (CoRE).
- Based on the optimized REST architectural style for constrained devices and networks used in wireless sensor (IoT) networks.
---
## CoAP vs HTTP
- HTTP-like but based on UDP (no TCP).
- Client/Server (HTTP verbs, status codes HTTP-like).
- “Options” (like HTTP headers) are binary.
- Quality of Service with “confirmable” messages.
- Security with DTLS (Datagram TLS).
- Resource discovery.
---
## CoAP Message Format
- **Ver (Version):** 2 bits indicating the CoAP version.
- **T (Type):** Message type (Confirmable, Non-confirmable, Acknowledgment, Reset).
- **TKL (Token Length):** 4 bits indicating the length of the Token field.
- **Code:** 8 bits indicating the message type (request, success, client error, server error).
- **Message ID:** 16 bits for detecting message duplication and matching acknowledgments.
---
## CoAP Message Exchanges
- Confirmable request/response.
- Observer.
- Resource discovery.
---
## CoAP vs MQTT
|   |   |   |
|---|---|---|
|Feature|CoAP|MQTT|
|Communications Model|Request-Response, Publish-Subscribe|Publish-Subscribe|
|RESTful|Yes|No|
|Transport Layer Protocol|UDP (TCP can be used)|TCP (UDP can be used; MQTT-SN)|
|Header|4 bytes|2 bytes|
|Number of Message Types|4|16|
|Messaging|Asynchronous & Synchronous|Asynchronous|
|Scalability|Complex|Simple|
|Security|DTLS|SSL/TLS|
|QoS options|Yes (Confirmable/Non-confirmable messages)|Yes (3 levels)|
|Encoding|Binary|Binary|
|Dynamic discovery|Yes|No|
---
# C5: LPWAN - Sigfox & LoRa
- Introduction to Sigfox and LoRa technologies.
---
## French Technologies
### Sigfox
- Created in TOULOUSE (FRANCE) in 2009.
- FRANCE fully covered since 2013.
- Hardware device solution from most of the silicon vendors.
- 72 countries deployed and seen as a single global network (as of Nov. 2020).
- Acquired by Unabiz in 2022.
### LoRa
- Created in GENOBLE (FRANCE) in 2009.
- Acquired by SEMTECH in 2012.
- SEMTECH is a Silicon vendor with an exclusivity.
- LoRaWan 1.0 released in 2015.
- Deployed by telecom companies nation wide.
- Thousands of private networks.
- TTN – crowdsourced global network.
- HELIUM – crowdsourced global network as a blockchain.
---
## LPWAN Common Architecture
- Messages captured by multiple antennas.
- Antennas forward messages to a network server.
- Network server transfers the payload to the custom backend.
- ROAMING (limited).
---
## Sigfox Architecture
- World-Wide network and single Network Server.
---
## Power Saving in LPWAN
- Using non-connected mode.
- Devices can deep sleep for months, wake up, send a message, and go back to sleep.
- Centralized control managed by the network server.
---
## Shared Radio Band
- SIGFOX & LoRaWan use ISM bands.
- Free to use if regulations are respected.
- Regulations vary by region.
- In Europe, communication is limited to 1% of the time per device.
---
## European Regulation on 868MHz ISM band
- Defined by laws like ERC-REC-70-03E.
- Limits the transmission time to a certain percentage of the time during a sliding hour (DUTY-CYCLE).
- Limits the transmission power.
|   |   |
|---|---|
|Frequency Range|Transmission Power|
|865.0 – 868.0 MHz|25 mW|
|868.0 – 868.6 MHz|25 mW|
|869.3 – 869.4 MHz|10 mW|
|869.7 – 870.0 MHz|25 mW|
|868.7 – 869.2 MHz|25 mW|
|869.4 – 869.65 MHz|500 mW|
---
## Two Approaches
- **SigFox – Ultra Narrow Band:**
    - Transmit a signal on the narrowest possible frequency band.
    - Maximize power in one point.
- **LoRa – Spread Spectrum:**
    - Transmit the same signal on multiple frequencies.
    - Bypass noise.
---
## Technology Symmetry
- **Sigfox:** Asymmetric technology. Complex to receive.
- **LoRa:** Symmetric technology. Transmission and reception have the same complexity.
---
## Key Takeaways
- LPWAN SIGFOX & LoRaWAN rely on ISM bands for low-cost deployment.
- Different technologies behind them.
- Created in FRANCE and now deployed worldwide.
- Respect regulations to share the ISM band.
- Allowing to communicate over long distance with a minimum of energy.
---
## Sigfox - The Big Picture
- Global, worldwide telecom operator.
- Device can communicate all over the world without roaming.
- Reduced “Time to get the first fired frame”.
- Device design simplified.
---
## Sigfox Strengths
- Fixed Packet Length
- Simplicity and efficiency.
## Sigfox over the Technology
- Encryption
- Message Signature
- Jamming Protection
- Communication Reliability
---
## Sigfox - European Regulation on 868MHZ ISM band
|   |   |   |
|---|---|---|
||Uplink|Downlink|
|**Sigfox**|Only 200KHZ. In Europe it is centered on 868.130MHz. In these 200KHz there are 2000 channel, each of them have a size on only 100Hz|are using a 10% duty cycle band for two reasons: A base-station responds to many different devices The radio situation for a base-station is better than for a device. You need more power to be received by a device.|
---
## Sigfox - Transmission
- **Transmission Radio sur DBPSK Differential Binary Phase Shift Keying**
    - Temps d’une trame:
        - 12B:2,08s
        - 8B:1,76s
        - 4B:1,44s
---
## Sigfox - Downlink Communications
- Downlink: GFSK Gaussian Frequency-Shift keying.
    - Symbol rate : 600 Bit/s
    - Frequency: Determined from the uplink message frequency
    - Frequency is 869.4MHz to 869.65MHz
    - Transmission power is 500mW
---
## Sigfox Ecosystem
- Get benefit of a large ecosystem with hundreds of available devices and tons of device-kit.
- https:// partners.sigfox.com
- https:// makers.sigfox.com
---
## Sigfox Network Server
- Receives messages and help IoT solution administrator to manage the subscription and device fleet.
- Network server is where you link your device with your final application.
---
## Sigfox use-cases in volume
- Security
- Assets tracking
### ATLAS
- A solution to get a device localization from a single frame based on received radio signal or WiFi signals around. This avoid using a GNSS chip for getting a location.
- Precision and compliance vary:
    - 1km to 20km for received radio signal
    - 30m for WiFi signals when exists
---
## LoRaWan
- LoRa = The physical radio layer
- LoRaWAN = The Networking Layer
- Secured and standardized protocol
---
## LoRaWan Numbers (as of Nov 2020)
- 180.000.000 LoRa compatible transceivers already distributed by Semtech
- 1.000.000 LoRa based gateway chips sold
---
## LoRa - Strengths
- POINT-TO-POINT RADIO TECHNOLOGY
- Variable Payload Length
- BI-DIRECTIONAL
- IS_M BAND
---
## LoRa SPREAD FACTOR
- Usually, the regulation rules are managed in the LoRa and LoRaWan stacks.
- Therefore, what you can do depends on the implementation and the zone you are.
### How this work?
- Getting more time to execute the frequency movement pattern allows a better decoding over noise.
- Better distance achieve, less loss, but lower throughput
---
## LoRaWan implementation
### What is it?
LoRaWan is one of the existing network implementation for LoRa.
Amazon SideWalk is another implementation of LoRa to build a network.
### LoRa Usage
- LoRa is also widely used in point-to-point application.
---
## LoRaWAN stack features
- Encryption is mandatory in a system where multiple networks co-exist.
- The encryption protects each operators against the competition as it protects the customer payload to be captured.
- The algorithm and the key generation are defined by the LoRaWAN specifications.
---
## LoRaWAN Defines
- Three Standard Channel
- The JOIN process. Each of them are 125kHz ( 375KHz are used ).
- Center frequency are 868.1 868.3 and 868.5 in Europe.
- They are occupying all the 868.0 -> 868.6 band.
- LoRaWAN networks in Europe supports 8 channels, other 5 channels are defined by the network operator, usually, in the other 1% bands.
---
## LoRaWAN Architecture
- DEVICES => GATEWAYS => NETWORK SERVER => CUSTOMER IT
- DOWNLINKS
### Scalability - Limitations
- No congestion management
- 3 channels are common for all the networks
- About 1000 device in a same area (even in different networks) will saturate the 8 available channels. (it depends on SF and duty cycle…)
---
## LoRaWAN Strengths and Weaknesses
### Strength
- Ability to offer TDOA location computing (Time Difference Over the Air) for non-GPS tracking (hundreds of meter precision)
- Ability to deploy private networks at low cost.
- Ability to support mobility with a reasonable loss rate.
- Throughput enabling multiple use-cases.
### Weakness
- Complex channel management in roaming and complex roaming. Channel map for a network operator have to be global.
- A really limited number of public offer and complex roaming capability makes it limited to private usage or country usage when covered.
- Software complexity making it a bit more expensive than competitors on the device side.
---
## LoRaWAN Application
### Smart City
- Smart city application
- Local mobility
- Public application  
    ### Agricultural Domain
- Agricultural domain
- Industrial Applications
---
## LoRaWAN Coverage
### Indoor vs Outdoor
- Private deployments
- 10 km coverage is what you can get with a good outdoor spot.
- Indoor antenna performance are usually around 300m around.
---
## The Things Network
- Is a crowdsourced network, deployed World-wide and free for use.
- Deployed by passioned people it proposes a good quality network In the main big cities. Open-source mindset.
- This network is use in many business application: the network server is use for simplifying private deployment.
- Uber for Telecom industry
---
## HELIUM
- Also crowdsourced IoT network, but it targets a different category of people to deploy the network.
- Instead of tech passionate, it target crypto investors.
- It is UBER + BITCOIN for Telecom industry
---
## Telecom Technologies
### Road map
- BPP - Traditional Telecom technologies A GLOBAL INITIATIVE applied on IoT
### 3GPP
- Multiple technologies
- Telecom operator technologies
### 3GPP Roadmaps
- Software update
- Hardware Deployment
---
## 3GPP Solutions in the 5G
## 5G release 15 is still not really documented on Te Internet about LTE-M & NB-loT improvement.
# C6: Radio Transmission and propagation
- Introduction to Radio Transmission and propagation.
---
## Radio Transmission
### Main points
- Units and definitions: Decibel, dBm, RSSI, Sensitivity and SNR
- Examples and studies of technical documentation
### Units and definitions: Decibel - 1
- Represented by a negative or positive number
$dB = 10 \log_{10} \frac{P_R}{P_T}$
Where:
_PR_ is the received power
_PT_ is the transmitted power
### Power ratio in dB
### Addition
$ + 10 dB Multiplication by 10$
$ +3 dB Multiplication by 2$
0_dBEquality_
### Substraction
$ -3 dB Division by 2$
$ -10 dB Division by 10$
### Example
- PR is 1 billion times smaller than PT  
    $ P_R = 10^{-9} * P_T $
_dB_ = 90_dBattenuation_
---
### The decibel for power: dBm
- Ratio (in decibel) between a power and the power of 1mW
$P(dBm) = 10 \log_{10} \frac{P(mW)}{1 mW}$
Where:_P_(_mW_) is the power in milliwatts
### Power ratio in dBm
### Addition
$ 0 dBm 1 mW$
$ + 3 dBm x2 à 2 mW$
$ +10 dBm x10 à 10 mW$
### Substraction
−3_dBm_0, 5_mW_
−10_dBm_0, 1_mW_
### Example
- Walkie-talkie has a transmission power of 2W  
    $ P(dBm) = 10 _{10} $
$ P(dBm) = 33dBm$
---
### Definitions: RSSI, Sensitivity, SNR
- RSSI (Received Signal Strength Indication): power PR of the received signal
- Sensitivity : minimum RSSI to receive a signal
- SNR (Signal over Noise Ratio): Ratio of PR and PN
---
### Definitions: Link Budget
- Link Budget : PT - Sensitivity
_LinkBudget_ = _PT_ − _Sensitivity_
Example:_LinkBudget_ = 0_dBm_ − (−100_dBm_) = 100_dB_
### Let’s Recap
- The decibel helps to represent ratio (dB) or power (dBm).
- RSSI is the power received.
- If the RSSI is above the receiver sensitivity, the transmission is successful.
- The Link budget evaluate the potential of the transmission.
- The SNR is the ratio between the signal and the noise.
- With a high SF, the reception capabilities are improved (sensitivity and SNR)
---
# C7: LoRaWAN Physical Layer
- Introduction to LoRaWAN Phyiscal Layer
---
## LoRa modulation Physical Layer
### Main points
- The LoRa frame
- LoRa bitrate: Spreading Factor, Coding Rate, Bandwidth, Time-On-Air and Duty-Cycle
- The simulation of a LoRa transmission
- The consumption and the autonomy of a LoRa device
### Let’s Recap
### Tradeoffs
- LoRa is a ” long distance ” and ” low speed ” protocol
- It transmits on channels in the 868 MHz band
- LoRa uses Spreading Factors : [ SF6, SF7, SF8, SF9, SF10, SF11 and SF12 ]
- If two LoRa devices are using different SF :
### Communication
- They can transmit at the same time on the same channel SF5, SF6, SF7, SF8, SF9, SF10, SF11 and SF12
### LoRa Frame
- Using Time Division Multiplexing and Multiple Spreading Factor can increase number of devices per 100seconds.
### Symbol and Bits Representation
$T_{symbol} = 2^{SF} * \frac{1}{BW}$  
Where:
- _T_ is the Symbol duration
    
    _symbol_
    
- _SF_ is the Spreading Factor
- _BW_ is the Bandwidth
### Explanation
- The C hi r p (s y m b o l ) - 3_X_ − _bitsrepresentationàSFX_(5_to_12)
### The L o R a f r am e - 1
_Transmitting_10_bits_ =  > 1024_conbinationsSF_10
### LoRa Bitrate
BitRate = Spreading Factor / SymbolDuration
$BitRate = \frac{SF}{T_{symbol}}$
### Example
Case 1: For SF7, 125 kHz  
$BitRate = \frac{7 *125*10^3}{\frac{2^7}{1}} = 6,896 Kbps$  
Case 2: For SF12, 125 kHz
$BitRate = \frac{12 * 125 * 10^3}{\frac{2^{12}}{1}}= 966 bps$
### Coding Rate
- Additional bits Detect and correct errors  
    Ratio = 4/5
$BitRate(Real) = BitRate(Theo) * \frac{CodingRate}{5} $  
LoRa Frame Elements  
Preamble, Data, CRC, Payload, Header
### Time on Air
Where:
$ TimeOnAir = \frac{FrameSize}{BitRate}$
### LoRa Air Time Calculator
[https://loratools.nl/#/airtime](https://loratools.nl/#/airtime)
### Duty cycle
Limiting the transmission time  
Factors: Spreading Factor, Limit the transmission time  
=> 1% of the time Energy consumption
---
# C8: LoRaWAN Protocol
- Introduction to LoRaWAN Protocol
---
## The LoRaWAN protocol:
### Main points
- LoRaWAN ecosystem - Specification - LoRa vs LoRaWAN
- LoRaWAN infrastructure - Device - Gateway - LoRaWAN Server
- LoRaWAN Security
- Device classes
- Activation methods: ABP or OTAA  
    ### How to …
- … prevent replay attack?
- … change the communication parameters?
- … change Network operator?
- Optimization of the communication: ADR
### LoRa vs LoRaWAN
- LoRa = Type of modulation (Chirp)
- LoRaWAN = Secured and standardized protocol
---
### Version
1.0.0 1.0.1 1.0.2 1.0.3 1.0.4 2020 1.0 1.1 1.2
---
### Elements Infrasctructure:
- Device
- Gateway
- LoRaWAN Server
LoRaWAN frame, is the User Payload and Security information
---
## LoRaWAN Network Server and Application Server
### Network Server
### SECURITY
- CONFIDENTIALITY: Nobody can understand what the end-device says
- INTEGRITY: Nobody can change the transmitted frame
- AUTHENCITY: Only allowed end-device can send on the Network Server  
    #### What is the purpose?
- The L o R aW AN G at e way s:
    - Programmed DONWLINK Scheduled
### Class
- A
- B
- C
### Device classe, all support Class A, but other Classes require support to B or C
Class A: Limited downlink capabilities, low power consumption
Class B: Same as class A, Additional listening slots, more power consumption
Class C: Same as class A, Always listening, High power consumption
### What’s is it depends on?
- Packet transmission time
- TIME ON AIR
- 1% Time duration
- DUTY CYCLE
---
## Activation of LoRa Devices
- Activation By Personalization (ABP)
- Over The Air Activation (OTAA)
---
## Act i v at i o n B y P e r s o nal i z at i o n (A B P )
- Stored parameters on the server
- Programmed parameters in the component  
    ###\#Parameters Required
- DevAddr
- NwkSkey
- AppSKey
---
## Ove r T h e Ai r Ac ti vati o n ( O T AA) - 1
### Sequence
1. The LoRa Device issues a Join-Request using the DevEUI , AppEUI , and AppKey information it has.
2. The Network Server authenticates the Join Request and validates it. It then generates a NwkSKey, an AppSKey , and a DevAddr .
3. The Network Server returns the DevAddr , along with a series of parameters .
4. The parameters provided during the Join-Accept, associated with the AppKey , allow the LoRa Device to generate the same NwkSkey and AppSKey that were initially generated on the Network Server.
---
## Ch o ice b e t w e e n A B P o r O T A A ?
- Global security
- Frame Counter Management: Protection against replay attacks
- Change of network and server
- Modification of LoRa device parameters
---
## The REPLAY attack
- Using the same message.
- Use OTAA activation instead of ABP
- Keep the value of