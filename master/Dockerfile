FROM jenkinsci/jenkins
RUN install-plugins.sh git simple-theme-plugin swarm
COPY tcu-init.groovy /usr/share/jenkins/ref/init.groovy.d/
