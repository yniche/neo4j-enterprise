# neo4j V 0.2.1
neo4j Enterprise Edition 2.1.7 is the one year personal licence (good for emp < = 3), and renvenue < 100K US$

Use this to replace neo4j community version, so backup, and cache features can be used to boost both security + performance


Docker image which installs the Neo4J 2.1.7 Enterprise Edition.

Setup

Execute this command:

docker run -i -t -d --privileged -p 7474:7474 machool/neo4j

To access, go to http://localhost:7474 with your browser.

Image inhertinace

Based on the https://github.com/tpires/neo4j neo4j Dockerfile.
