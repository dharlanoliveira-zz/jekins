FROM jenkinsci/jenkins
RUN install-plugins.sh git simple-theme-plugin workflow-aggregator swarm gitlab-plugin scriptler job-dsl compress-buildlog
RUN install-plugins.sh greenballs
COPY tcu-init.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY admin-config.xml /var/jenkins_home/admin-config.xml