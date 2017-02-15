#!/bin/bash
docker rm -f jenkins
docker run -d  --name jenkins --env JAVA_OPTS="-Dhudson.Main.development=true -Djenkins.install.runSetupWizard=false" -p 8080:8080 -p 50000:50000 jenkins-tcu
