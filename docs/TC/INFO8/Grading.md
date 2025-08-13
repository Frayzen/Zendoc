---
title: Grading
Owner: "Florian "
---
Grading
# Barème moulinette
## NoSQL
- Chaque question d’un TP rapporte le même nombre de points.
    - Exemple : Si un TP comporte 15 questions, chaque question vaut (1/15) × 20 points.
- Pour obtenir les points d’une question, tous les tests doivent être validés à 100 %.
    - Exemple : Si un seul des 1000 tests échoue, vous ne gagnez aucun point pour cette question.
## Scale
- Même principe que pour NoSQL : tous les tests d’une question doivent être validés à 100 % pour obtenir les points.
    - Barèmes de notation :
        - TD 1 (/20) :
            - `1__Restocking_warehouse` : 1
            - `2__User_1_purchases_200_petits_fruits_and_all_exercices` : 1
            - `3__User_2_purchases_200_petits_fruits_and_200_petits_pc` : 1
            - `4__User_1_purchases_200_petits_fruits_and_200_petits_pc` : 1
            - `5__User_2_purchases_5_exercices__failure` : 2
            - `6__User_2_purchases_1_unknown_product__failure` : 2
            - `7__Checking_stocks` : 4
            - `8__Checking_User_1_purchases` : 4
            - `9__Checking_User_2_purchases` : 4
        - TD 2 (/44) :
            - `1__Restocking_warehouse` : 1
            - `2__User_1_purchases_200_petits_fruits_and_all_exercices` : 1
            - `3__User_2_purchases_200_petits_fruits_and_200_petits_pc` : 1
            - `4__User_1_purchases_200_petits_fruits_and_200_petits_pc` : 1
            - `5__User_2_purchases_5_exercices__failure` : 2
            - `6__User_2_purchases_1_unknown_product__failure` : 2
            - `7__Checking_stocks` : 4
            - `8__Checking_User_1_purchases` : 4
            - `9__Checking_User_2_purchases` : 4
            - `10__Checking_User_1_s_first_purchase_receipt` : 6
            - `11__Checking_User_1_s_second_purchase_receipt` : 6
            - `12__Checking_User_2_s_first_purchase_receipt` : 6
            - `13__Checking_a_unknown_receipt_for_User_2__failure` : 6
        - TD 3 (/57) :
            - `1__Restocking_warehouse` : 1
            - `2__User_1_purchases_200_C__300_A__200_B` : 1
            - `3__User_2_purchases_400_C__400_A__400_B__200_D` : 1
            - `4__User_3_purchases_50_C` : 1
            - `5__User_4_purchases_100_C__500_A` : 1
            - `6__User_2_purchases_1000_A__failure` : 2
            - `7__User_2_purchases_30_unknown_product__failure` : 2
            - `8__Checking_stocks` : 2
            - `9__Checking_User_1_purchases` : 2
            - `10__Checking_User_4_purchases` : 2
            - `11__Checking_Product_rankings` : 6
            - `12__Checking_Customer_rankings_for_Product_C` : 6
            - `13__Searching_all_receipts_containing_mentions_of_product_A` : 6
            - `14__Searching_all_receipts_belonging_to_User_4` : 6
            - `15__Searching_all_receipts_belonging_to_User_2_and_containing_mentions_of_product_B` : 6
            - `16__Searching_all_receipts_containing_mentions_of_product_X` : 6
            - `17__Searching_all_receipts_containing_mentions_of_product_A_or_X` : 6
## Deploy
- Les TPs sont notés de façon linéaire :
    - Exemple : Si vous validez 40 % des tests, vous obtenez 8/20.
- Tous les TPs de Deploy sont équivalents dans la moyenne, sauf le TP Kubernetes qui compte double.
## Calcul de la moyenne des TPs
La moyenne des TPs est calculée comme suit :
```Plain
NOTE_FINALE_TP = (TP_NoSQL_1 + TP_NoSQL_2 + TP_NoSQL_3 + TP_Scale_1 + TP_Scale_2 + TP_Scale_3  + TP_Deploy_1_Docker +  TP_Deploy_2_ByHand +  TP_Deploy_3_Docker_Compose +  TP_Deploy_4_Kubernetes * 2) / 11
```
# Validation de l'ECUE
- Note seuil : Vous devez obtenir au moins 8/20 sur la NOTE_FINALE_TP pour valider l’ECUE.
- Note finale de l’ECUE :
```Plain
NOTE_ECUE = NOTE_FINALE_TP * 20% + NOTE_PROJET * 80%
```
# Gestion des erreurs et ajustements éventuels
- En cas de problème confirmé de moulinette sur une partie ou une question,  
    celle-ci sera retirée du TP et ses points seront répartis sur les autres parties du TP concerné.
- Le barème ne sera pas modifié en cours  
    d’ECUE. Tout ajustement éventuel sera effectué uniquement après les  
    sessions de rattrapage, et uniquement s’il est en faveur des étudiants,  
    avec l’accord de la Direction de Formation.
  
|   |   |   |   |   |
|---|---|---|---|---|
|Critère|Excellent|Attendu|Passable|Insuffisant|
|Livrable|Le projet contient un module commun pour extraire le code redondant interfaces de contrats, convertors, etc)|Le projet compile (`mvn package` à la racine termine avec succès)|Le projet est un module Maven constitué de sousmodules par service.|Le projet est divisé en services dans des sousdossiers.|
|Fonctionnement|Le projet implémente les features demandées par le sujet et contient des tests d'intégrations vérifiant ces features.  <br>Des features additionnelles sont implémentées.|Le projet implémente les features demandées par le sujet et contient des tests d'intégrations vérifiant ces features.|Le projet implémente un sous ensemble des features demandées par le sujet et contient des tests d'intégrations les vérifiant.|Peu de features sont implémentées et/ou ne respectent pas les spécifications du sujet. Absence de tests d'intégration|
|Architecture interne|Les services suivent l'architecture en couche, respectent l'isolation des couches et utilise des convertors entre les  <br>DTO et les Entity.|Les services suivent  <br>l'architecture en couche, l'isolation des couches est respectée, les DTO  <br>et les Entity sont correctement nommés et utilisés dans les bonnes  <br>couches.|Les services suivent l'architecture en couche  <br>et l'isolation des couches est respectée (la couche presentation n'a  <br>accès qu'aux DTO et au service, la couche service a accès aux  <br>utilitaires et au repository, etc...)|Les différents services du projet ne suivent pas l'architecture en couche ou ne respecte pas l'isolation entre les couches.|
|Architecture globale|L'isolation des bases de données des services est respectée (les services communiquent entre eux et ne lisent pas les bases de données des autres). Le choix des systèmes de base de donnée  <br>est cohérent avec le rôle du service. Un service de fanout est implémenté pour répartir les messages entre les applications via Redis.|L'isolation des bases de données  <br>des services est respectée (les services communiquent entre eux et ne  <br>lisent pas les bases de données des autres). Le choix des systèmes de  <br>base de donnée est cohérent avec le rôle du service.|L'isolation des base de données des services  <br>est respectée (les services communiquent entre eux et ne lisent pas les  <br>bases de données des autres). Le choix des systèmes de base de donnée  <br>n'est pas approprié avec le rôle du service.|La communication entre les services est  <br>insuffisante ou inexistante, l'isolation des bases de donnée des  <br>services n'est pas respectée.|
|Maintenabilité|Le code est organisé, une coding style est  <br>respectée à travers tout le projet. Des logs sont affichés dans les différents niveaux des applications. Une documentation explicite les choix d'architecture du projet et une documentation technique style Javadoc est disponible.|Le code est organisé, une coding  <br>style est respectée à travers tout le projet. Des logs sont affichés  <br>dans les différents niveaux des applications. Une documentation  <br>explicite les choix d'architecture du projet.|Le code est organisé, une coding style est respectée à travers tout le projet.||
|Déploiement Kubernetes|Le projet contient un déploiement Kustomize valide permettant le déploiement des services développés et de ses dépendances (bases de données et Redis) dans un cluster k3s simple et  <br>permet la communication de tous les composants entre eux. Les composants  <br>front-facing sont accessibles via des Ingress.|Le projet contient un déploiement Kustomize valide permettant le déploiement des services développés et de ses dépendances (bases de données et Redis) dans un cluster k3s simple  <br>et permet la communication de tous les composants entre eux. Les services front-facing sont accessibles via des services NodePort.|Le projet contient un déploiement Kustomize  <br>contenant des objets d'API Kubernetes valides. Les applications sont lancées mais ne peuvent pas communiquer entre elles ou avec les utilisateurs.|Le projet contient un déploiement Kustomize  <br>valide (qui peut être compilé à l'aide de la CLI Kustomize). Le projet  <br>n'est pas déployé ou des composants sont manquants.|