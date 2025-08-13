---
Owner: "Florian "
---
## **1. Définition et Concepts de Base**
- **IoT** : Réseau d'objets physiques connectés à Internet, capables de collecter et d'échanger des données.
- **Couches IoT** :
    - **Devices** : Capteurs/actionneurs (ex: température, mouvement).
    - **Communication** : Protocoles (WiFi, Bluetooth, LoRa, etc.).
    - **Platform** : Traitement des données (cloud, edge computing).
## **2. Protocoles de Communication**
### **Courtes Distances**
- **WiFi (802.11)** : Haut débit, courte portée (<100m), versions : 802.11b/g/n/ac/ax.
- **Bluetooth/BLE** : Faible consommation, portée <30m, latence ~6ms.
- **Zigbee (802.15.4)** : Mesh, faible puissance, 250 kbps, 65536 nœuds max.
- **Z-Wave (ITU-T G.9959)** : Domotique, 232 nœuds max, mesh.
### **Longues Distances (LPWAN)**
- **LoRa/LoRaWAN** : Longue portée (15km), faible débit, SF7-SF12.
- **Sigfox** : Ultra Narrow Band, 12 octets/message, 140 messages/jour.
- **NB-IoT/LTE-M** : Opérateurs telecom, 3GPP, basse consommation.
## **3. Protocoles Applicatifs**
- **MQTT** :
    - **Modèle** : Publish/Subscribe via un broker.
    - **Header** : 2 octets, 14 types de messages.
    - **QoS** : 0 (fire and forget), 1 (au moins une fois), 2 (exactement une fois).
- **CoAP** :
    - **Basé sur** : REST/UDP, asynchrone.
    - **Méthodes** : GET, PUT, POST, DELETE.
- **HTTP REST** : Verbose, client-serveur, méthodes similaires à CoAP.
## **4. Technologies Clés**
- **6LoWPAN** : Adaptation d'IPv6 sur 802.15.4 (compression UDP, suppression champs redondants).
- **Edge Computing** : Réduction de latence, traitement local des données.
- **Sécurité** : Menaces à tous niveaux (MITM, DDoS), chiffrement essentiel.
## **5. Comparaisons**
|   |   |   |   |   |
|---|---|---|---|---|
|**Technologie**|**Portée**|**Débit**|**Consommation**|**Topologie**|
|BLE|<30m|1Mbps|Très faible|P2P, étoile|
|Zigbee|<100m|250kbps|Faible|Mesh, arbre|
|LoRaWAN|15km|0.3-50kbps|Faible|Étoile|
|Sigfox|50km|100bps|Très faible|Étoile|
## **6. Chiffres Clés**
- **Messages WhatsApp/min (2020)** : 41,6 millions.
- **Devices connectés/personne (2020)** : 6,58.
- **Taille trame MAC 802.15.4** : 127 octets max (payload: 102 octets).
## **7. Bonnes Pratiques**
- **Choix techno** : Distance, débit, énergie, coût.
- **Sécurité** : Chiffrement (AES), gestion des clés (OTAA > ABP pour LoRaWAN).
- **Optimisation** : ADR (Adaptive Data Rate) pour LoRaWAN.
## **8. Freins au Développement IoT**
- Sécurité insuffisante.
- Interopérabilité limitée.
- Coûts de déploiement.
- Vie privée/éthique.
- Complexité de gestion.
## **9. Exemples d'Applications**
- **Fitbit** : Collecte données santé via BLE + smartphone.
- **Smart Agriculture** : Capteurs LoRa pour surveillance des cultures.
- **Villes Intelligentes** : Éclairage connecté, gestion du trafic.
## **10. Révisions Spécifiques**
- **LoRaWAN** : Classes A/B/C, activation OTAA/ABP, calcul Time-on-Air.
- **MQTT vs CoAP** : Publish/Subscribe vs REST, TCP vs UDP.
- **Règlementation** : Duty-cycle 1% en Europe (868MHz).
---
### **Outils Pratiques**
- **Calculateur Time-on-Air LoRa** : [loratools.nl](https://loratools.nl/)
- **Calculateur consommation énergie** : [dramco.be](https://dramco.be/tools/lora-calculator/)