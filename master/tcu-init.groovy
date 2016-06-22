import jenkins.model.*;

def inst = Jenkins.instance;
println "Desabilitando a segurança"
inst.disableSecurity();
println "Desabilitando executores no master"
inst.setNumExecutors(0);

//inst.descriptor.all() - obter todos os descritores
println "Alterando tema para material design"
def descriptor = inst.getDescriptor(org.codefirst.SimpleThemeDecorator);
descriptor.cssUrl = "https://jenkins-contrib-themes.github.io/jenkins-material-theme/dist/material-indigo.css"

println "Criando job para uso do Job DSL Plugin"
def jobName = "job-para-criacao-de-projetos-tcu"
def configXml = new File('/var/jenkins_home/admin-config.xml').getText('UTF-8')

def xmlStream = new ByteArrayInputStream( configXml.getBytes() )

Jenkins.instance.createProjectFromXML(jobName, xmlStream)
