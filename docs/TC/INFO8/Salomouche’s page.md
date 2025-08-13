---
title: Salomouche’s page
Owner: Matcha
---
mvn -X quarkus:dev -pl repo-social/
  
mvn checkstyle:checkstyle
  
sudo systemctl start neo4j  
sudo systemctl daemon-reload  
sudo systemctl status neo4j  
sudo systemctl enable neo4j
  
sudo update-alternatives --config java
JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64 ./test_nodes.sh
  
social-req get “…”  
  
`"bolt://localhost:7687"`