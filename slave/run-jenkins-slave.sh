#!/bin/sh

LABEL="slave-$(date +"%m-%d-%y_%H-%M-%S")"
DESCRIPTION="Slave do jenkins criado dinamicamente para builds de pipelines"
docker run -d csanchez/jenkins-swarm-slave -master http://192.168.0.10:8080 -username jenkins -password jenkins -labels $LABEL -name $LABEL -description "$DESCRIPTION" -executors 1
