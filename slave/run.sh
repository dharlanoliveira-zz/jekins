#!/bin/sh

LABEL="slave-$(date +"%m-%d-%y_%H-%M-%S")"
DESCRIPTION="Slave do jenkins criado dinamicamente para builds de pipelines"
#docker run -d csanchez/jenkins-swarm-slave -master http://192.168.0.10:8080 -username jenkins -password jenkins -labels $LABEL -name $LABEL -description "$DESCRIPTION" -executors 1
docker run -v /var/run/docker.sock:/var/run/docker.sock \
-v /mvn-repository:/mvn-repository \
-v /var/lib/jenkins/workspace/:/var/lib/jenkins/workspace/ \
-d rgoodwin/centos7.1-jenkins-swarm-slave:latest \
-master http://192.168.0.10:8080 \
-username jenkins -password jenkins \
-labels $LABEL -name $LABEL -description "$DESCRIPTION" \
-executors 1