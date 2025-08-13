---
Matière:
  - "[[Déploiement et Virtualisation]]"
Type: Cours
Date du cours: 2025-04-03
Supports:
  - "[[presentation_slides 2.pdf|presentation_slides 2.pdf]]"
---
## 🏗️ Pourquoi avons-nous besoin de plusieurs conteneurs ?
- Séparer les composants logiciels (base de données, front-end, back-end…)
- Équilibrage de charge et réplication
- Mises à jour progressives ou variantes de produits
- Etc.
  
---
## ⚡ Défis liés à la gestion de plusieurs conteneurs
- Assurer la cohérence des microservices
- Effectuer des mises à jour sans interruption
- Déployer sur plusieurs hôtes avec une configuration réseau adaptée
- Répliquer les services pour répartir la charge
- Gérer les images de manière efficace
- Automatiser les tests, l'intégration et le déploiement (ex : blue/green deploy, canary releases…)
  
---
# 🐳 Gestion de plusieurs conteneurs avec Docker Compose
  
Docker Compose permet de définir une application basée sur des conteneurs de manière déclarative.
## 📌 Fonctionnalités :
- Configuration des services (conteneurs en cours d’exécution)
- Gestion des ports
- Création de réseaux entre services
- Gestion des volumes
- Paramètres de déploiement (ressources, cluster)
🔗 **Documentation officielle** : [Docker Compose](https://docs.docker.com/compose/compose-file/)
## 🚀 Exemple : Démarrage d’un conteneur "hello-world"
```YAML
version: '3'
services:
  hello:
    image: hello-world
```
### Exécution :
```Shell
docker-compose up
```
### Sortie attendue :
```Plain
Creating network "tmp_default" with the default driver
Pulling hello (hello-world:)...
latest: Pulling from library/hello-world
1b930d010525: Pull complete
Digest: sha256:b8ba256769a0ac28dd126d584e0a2011cd2877f3f76e093a7ae5Status: Downloaded newer image for hello-world:latest
Creating tmp_hello_1 ... done
Attaching to tmp_hello_1
hello_1 |
hello_1 | Hello from Docker!
hello_1 | This message shows that your installation appears to behello_1 |
(…)
hello_1 |
tmp_hello_1 exited with code 0
```
  
---
## 🖥️ Exemples avancés avec Docker Compose
### 1️⃣ Application avec Redis
```YAML
version: '3'
services:
  web:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - .:/code
  redis:
    image: "redis:alpin
```
### 2️⃣ Application front/back-end
![[image 94.png|image 94.png]]
L'application est composée des éléments suivants :
- **2 services** basés sur des images Docker : `webapp` et `database`
- **1 secret** (certificat HTTPS), injecté dans le frontend
- **1 configuration** (HTTP), injectée dans le frontend
- **1 volume persistant**, attaché au backend
- **2 réseaux** pour l'interconnexion des services
```YAML
services:
  frontend:
    image: awesome/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    configs:
      - httpd-config
    secrets:
      - server-certificate
  backend:
    image: awesome/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier
volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"
networks:
  front-tier: {}
  back-tier: {}
```
---
# 🔐 Configurations, Secrets et Environnement
  
## 🛠️ Configurations (`docker config`)
Les **configurations** permettent d’injecter des fichiers de configuration dans des conteneurs.  
Elles sont souvent utilisées pour **les fichiers de configuration d’un serveur web, d’une base de données, etc.**
### 📌 Commandes utiles :
- Lister les configurations :
    
    ```Shell
    docker config ls
    ```
    
- Ajouter une configuration :
    
    ```Shell
    echo "server { listen 80; }" | docker config create my_nginx_config -
    ```
    
- Attacher une configuration à un service dans un fichier `docker-compose.yml` :
    
    ```YAML
    services:
      web:
        image: nginx
        configs:
          - source: my_nginx_config
            target: /etc/nginx/nginx.conf
    configs:
      my_nginx_config:
        external: true
    ```
    
  
---
## 🔑 Secrets (`docker secret`)
Les **secrets** permettent de stocker et distribuer des informations sensibles, **comme des mots de passe, des clés API, ou des certificats TLS**.
Contrairement aux configurations, les **secrets sont chiffrés et ne sont accessibles que par les services autorisés**.
### 📌 Commandes utiles :
- Lister les secrets :
    
    ```Shell
    docker secret ls
    ```
    
- Créer un secret :
    
    ```Shell
    echo "motdepasse" | docker secret create db_password -
    ```
    
- Attacher un secret à un service :
    
    ```YAML
    services:
      database:
        image: mysql
        secrets:
          - db_password
    secrets:
      db_password:
        external: true
    ```
    
- Utiliser un secret dans un conteneur :
    
    ```Shell
    cat /run/secrets/db_password
    ```
    
      
    

> [!important] Les secrets ne sont disponibles que pour les services Swarm. Ils ne fonctionnent pas avec docker-compose en mode local.
  
---
## 🌍 Variables d’environnement (`.env`)
Les **variables d’environnement** permettent de paramétrer un conteneur sans modifier l’image Docker.
Elles sont pratiques pour définir des **ports, des chemins, des identifiants, etc.**
📌 **Déclaration dans un fichier** `**.env**` :
```Shell
DB_HOST=localhost
DB_USER=root
DB_PASS=supersecret
```
📌 **Utilisation dans** `**docker-compose.yml**` :
```YAML
services:
  app:
    image: my_app
    environment:
      - DB_HOST=${DB_HOST}
      - DB_USER=${DB_USER}
      - DB_PASS=${DB_PASS}
```
📌 **Passage de variables à** `**docker run**` :
```Shell
docker run -e "DB_HOST=localhost" -e "DB_USER=root" my_app
```
📌 **Lister les variables dans un conteneur en cours d’exécution** :
```Shell
docker exec my_container env
```
  

> [!important] Bonnes pratiques :
> 
> - **Ne jamais stocker les secrets dans** `**.env**` (utiliser `docker secret`).
> - **Utiliser des valeurs par défaut** (`DB_USER=${DB_USER:-default_user}`).
> - **Centraliser les configurations sensibles** dans des fichiers `.env` ignorés par Git (`.gitignore`).
  
---
# ⚙️ Docker Swarm
### 🔹 Qu’est-ce que Docker Swarm ?
Docker Swarm est une solution intégrée à Docker permettant de **gérer plusieurs conteneurs sur plusieurs machines**.  
Il permet de **créer un cluster**, d’**équilibrer la charge** et d’**automatiser le déploiement** des applications.
### 🔹 Pourquoi utiliser Docker Swarm ?
✅ Facile à configurer (intégré à Docker)  
✅ Supporte **le scaling automatique** des services  
✅ Gestion intégrée des **secrets et configurations**  
✅ Équilibrage de charge natif entre les conteneurs  
✅ Compatible avec `docker-compose` pour le déploiement
### 🚀 Commandes de base
📌 **Initialiser un cluster Swarm** (sur le premier nœud) :
```Shell
docker swarm init
```
📌 **Ajouter un nœud au cluster** :
```Shell
docker swarm join --token <TOKEN> <MANAGER_IP>:2377
```
📌 **Lister les nœuds du cluster** :
```Shell
docker node ls
```
📌 **Déployer une application avec Swarm** :
```Shell
docker stack deploy -c docker-compose.yml my_app
```
📌 **Lister les services actifs** :
```Shell
docker service ls
```
📌 **Mettre à l’échelle un service** (ex: 3 instances) :
```Shell
docker service scale my_service=3
```
📌 **Arrêter le cluster Swarm** :
```Shell
docker swarm leave --force
```
  
### 🔹 Différence entre Docker Swarm et Kubernetes
|   |   |   |
|---|---|---|
|Fonctionnalité|Docker Swarm 🐳|Kubernetes ☸️|
|Facilité de configuration|✅ Simple et rapide|❌ Plus complexe|
|Équilibrage de charge|✅ Automatique|✅ Automatique|
|Gestion avancée du cluster|❌ Basique|✅ Très avancée|
|Scaling automatique|✅ Manuel|✅ Automatique|
|Support multi-cloud|❌ Limité|✅ Oui|

> Docker Swarm est une solution simple et efficace pour orchestrer des conteneurs, mais Kubernetes est plus puissant pour les gros déploiements.
---
|   |   |   |
|---|---|---|
|Mode|Conteneurs|Machines|
|`docker run`|1|1|
|`docker-compose`|n|1|
|`docker swarm`|n|n|
---
# ☸️ Kubernetes : Orchestration avancée des conteneurs
### 🔹 Qu’est-ce que Kubernetes ?
Kubernetes (K8s) est une plateforme open-source qui **automatise le déploiement, la mise à l’échelle et la gestion des conteneurs** sur un cluster de machines.
Il est plus puissant que Docker Swarm mais aussi plus complexe à configurer.
### 🔹 Pourquoi utiliser Kubernetes ?
✅ **Gestion automatique du scaling** des applications
✅ **Récupération automatique** des conteneurs défaillants
✅ **Équilibrage de charge avancé**
✅ Compatible avec **tous les grands cloud providers**
✅ **Écosystème riche** avec des outils comme Helm, Istio, etc.
---
### 🚀 Commandes de base
📌 **Lancer un cluster local (Minikube)** :
```Shell
minikube star
```
📌 **Déployer une application** :
```Shell
kubectl apply -f deployment.yaml
```
📌 **Lister les pods en cours d’exécution** :
```Shell
kubectl get pods
```
📌 **Mettre à l’échelle une application (ex: 3 instances)** :
```Shell
kubectl scale deployment my_app --replicas=3
```
📌 **Exposer un service** :
```Shell
kubectl expose deployment my_app --type=LoadBalancer --port=80
```
📌 **Supprimer une application** :
```Shell
kubectl delete deployment my_app
```
---
### 🔹 Kubernetes vs Docker Swarm
|   |   |   |
|---|---|---|
|Fonctionnalité|Kubernetes ☸️|Docker Swarm 🐳|
|Facilité d’installation|❌ Complexe|✅ Simple|
|Scaling automatique|✅ Oui|❌ Manuel|
|Gestion des défaillances|✅ Oui|❌ Basique|
|Support multi-cloud|✅ Oui|❌ Limité|

> Kubernetes est idéal pour les environnements complexes nécessitant scalabilité et haute disponibilité.
---
# 🔄 Alternatives à Docker
Docker n'est pas la seule solution pour gérer des conteneurs. Voici quelques alternatives :
### 🏗️ **LXC (Linux Containers)**
- Conteneurs légers proches des machines virtuelles
- Plus bas niveau que Docker (utilisé par Proxmox)
### 🖥️ **Podman + Buildah**
- Alternative sans daemon (`rootless`)
- Plus sécurisé (pas besoin de privilégier root)
- Compatible avec les images Docker
### ⚙️ **systemd-nspawn**
- Intégré à **systemd** (Linux)
- Similaire à `chroot` mais avec isolation améliorée
### 🔥 **RKT (obsolète)**
- Créé par CoreOS, remplacé par Kubernetes & Podman
  
|   |   |
|---|---|
|Outil|Fonctionnalité principale|
|LXC|Machine virtuelle légère|
|systemd-nspawn|Conteneur basé sur systemd|
|RKT (obsolète)|Alternative sécurisée à Docker|
|Podman + Buildah|Conteneurs rootless et sans daemon|

> 💡 Podman + Buildah est l’alternative la plus proche de Docker, mais LXC reste populaire pour des usages plus bas niveau.
---
  
# 🚀 Environnements de Production Avancés
  
Docker est un excellent outil pour développer et tester des applications en conteneur, mais en production, des outils et architectures plus avancés sont nécessaires pour **la gestion des déploiements, la scalabilité et la sécurité**.
## 🏗️ **Les Standards OCI (Open Container Initiative)**
L’OCI (Open Container Initiative) est une organisation qui définit des **standards ouverts** pour les conteneurs afin d'assurer l'interopérabilité entre différentes solutions.
Elle couvre trois aspects principaux :
- **📦 Spécification des images** : un format standardisé pour construire et stocker des images conteneurs.
- **🏃 Spécification des runtimes** : un standard pour l’exécution des conteneurs.
    - Exemples : `runc` (utilisé par Docker), `crun` (plus léger et rapide).
- **🔄 Spécification des registres** : définit comment stocker et partager des images conteneurs.
    - Exemples : Docker Hub, Harbor, [Quay.io](http://quay.io/).
OCI permet d’avoir des solutions compatibles entre elles, **indépendamment du fournisseur**.
  
---
## ☁️ **Infrastructure et Plateformes de Conteneurs**
En production, les conteneurs peuvent être déployés selon deux approches principales :
### 🔹 **Infrastructure as a Service (IaaS)**
L’IaaS fournit une infrastructure virtuelle (machines, réseaux, stockage) sur laquelle on installe et gère nous-mêmes Docker et les orchestrateurs de conteneurs.
📌 **Exemples d’IaaS :**
- **VMware** : Virtualisation classique avec support des conteneurs.
- **OpenStack** : Cloud privé open-source pouvant gérer des VM et des conteneurs.
- **Apache Mesos** : Système de gestion de clusters pouvant exécuter des conteneurs et des VM.
✅ **Avantages** : Contrôle total, flexibilité.
❌ **Inconvénients** : Complexité de gestion, nécessite une équipe d’infrastructure.
### 🔹 **Platform as a Service (PaaS)**
Les solutions PaaS offrent une gestion simplifiée des conteneurs en **abstrayant l’infrastructure**. L’utilisateur déploie ses applications sans gérer directement les serveurs.
📌 **Exemples de PaaS pour conteneurs :**
- **Kubernetes** : L’orchestrateur de conteneurs le plus utilisé.
- **Docker Swarm** : Alternative plus simple mais moins puissante.
- **Red Hat OpenShift** : Plateforme basée sur Kubernetes avec outils supplémentaires.
✅ **Avantages** : Déploiement et scalabilité automatisés, gestion simplifiée.
❌ **Inconvénients** : Moins de contrôle sur l’infrastructure.
  
---
## 🔧 **Outils Complémentaires pour la Production**
### 🖥️ **Gestion des Clusters**
- **Rancher** : Plateforme pour gérer plusieurs clusters Kubernetes.
- **Portainer** : Interface web pour administrer Docker, Swarm et Kubernetes.
- **Swarmpit** : Outil de monitoring et de gestion pour Docker Swarm.
### 📊 **Monitoring et Logs**
- **Prometheus + Grafana** : Collecte de métriques et visualisation.
- **ELK Stack (Elasticsearch, Logstash, Kibana)** : Gestion centralisée des logs.
- **Datadog** : Monitoring cloud-friendly pour conteneurs.
### 🔒 **Sécurité et Gestion des Accès**
- **Harbor** : Registre d’images sécurisé avec scan de vulnérabilités.
- **Trivy** : Outil de scan de sécurité pour conteneurs.
- **Falco** : Détection d’intrusions en temps réel dans Kubernetes.
  
---
### 🏆 **Résumé : Quel choix pour la production ?**
|   |   |   |
|---|---|---|
|Solution|Type|Cas d’usage principal|
|**Docker Swarm**|Orchestration|Simplicité, petits clusters|
|**Kubernetes**|Orchestration|Standard, scalabilité avancée|
|**OpenShift**|PaaS|Kubernetes amélioré, entreprises|
|**Rancher**|Gestion|Admin multi-clusters Kubernetes|
|**Portainer**|Gestion|Interface web pour Docker et Swarm|

> 💡 Pour les déploiements complexes, Kubernetes est souvent préféré, mais Docker Swarm reste une option simple pour des infrastructures plus légères.