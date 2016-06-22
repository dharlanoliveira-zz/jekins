#!/usr/bin/env bash
docker run -d csanchez/jenkins-swarm-slave -master http://192.168.0.10:8080 -username jenkins -password jenkins -executors 1
