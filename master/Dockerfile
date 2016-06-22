FROM jenkinsci/jenkins
RUN install-plugins.sh git simple-theme-plugin workflow-aggregator swarm gitlab-plugin scriptler job-dsl
ENV JAVA_OPTS -Dhudson.diyChunking=true
COPY tcu-init.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY admin-config.xml /var/jenkins_home/admin-config.xml