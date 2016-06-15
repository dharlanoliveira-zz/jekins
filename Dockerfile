FROM jenkinsci/jenkins
COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt
COPY tcu-init.groovy /usr/share/jenkins/ref/init.groovy.d/
