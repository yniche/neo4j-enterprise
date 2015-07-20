## Neo4J + spatial 
## Based from maintainer Tiago Pires, tiago-a-pires@ptinovacao.pt
## Neo4J dependency: dockerfile/java:oracle-java8
## get java from trusted build
## Modified from: FROM dockerfile/java:oracle-java8  to below
FROM java:8

MAINTAINER Qiang Han <qiang.han@machool.com>

## install neo4j ent 2.1.7
ADD . /var/lib/neo4j 

## add launcher and set execute property
ADD launch.sh /
RUN chmod +x /launch.sh

## turn on indexing: http://chrislarson.me/blog/install-neo4j-graph-database-ubuntu
## enable neo4j indexing, and set indexable keys to name,age
RUN sed -i "s|#node_auto_indexing|node_auto_indexing|g" /var/lib/neo4j/conf/neo4j.properties
RUN sed -i "s|#node_keys_indexable|node_keys_indexable|g" /var/lib/neo4j/conf/neo4j.properties

## do not create initial schema on restore
## WORKDIR /var/lib/neo4j
## RUN ./bin/neo4j-shell -path /var/lib/neo4j/data/udo.db -file ./scripts/uman.cyp

WORKDIR /
## entrypoint

CMD ["/bin/bash", "-c", "/launch.sh"]
