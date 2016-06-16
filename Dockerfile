FROM jenkinsci/jenkins
RUN install-plugins.sh git docker-slaves simple-theme-plugin
COPY tcu-init.groovy /usr/share/jenkins/ref/init.groovy.d/
