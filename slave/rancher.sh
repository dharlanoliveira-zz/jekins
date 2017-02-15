#!/usr/bin/env bash
sudo docker run --name rancher -e CATTLE_HOST_LABELS='192.168.50.20=Jenkins%20Slave%201'  -d --privileged \
-v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher \
rancher/agent:v1.0.1 http://192.168.50.10:8090/v1/scripts/F89FD551A684CE5520B4:1466121600000:hYF08hYJRuKXY5Bn5KjvboAXQP0
