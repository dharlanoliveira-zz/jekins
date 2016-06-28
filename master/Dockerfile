FROM jenkinsci/jenkins
RUN install-plugins.sh git simple-theme-plugin workflow-aggregator swarm gitlab-plugin scriptler job-dsl compress-buildlog greenballs groovy-postbuild
COPY tcu-init.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY criar-todos-jobs-config.xml /var/jenkins_home/criar-todos-jobs-config.xml
COPY excluir-slaves-fantasmas-config.xml /var/jenkins_home/excluir-slaves-fantasmas-config.xml