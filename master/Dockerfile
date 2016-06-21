FROM jenkinsci/jenkins
RUN install-plugins.sh git simple-theme-plugin workflow-aggregator
ENV JAVA_OPTS -Dhudson.diyChunking=true
COPY tcu-init.groovy /usr/share/jenkins/ref/init.groovy.d/
