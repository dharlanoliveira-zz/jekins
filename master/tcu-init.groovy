import jenkins.model.*;

def inst = Jenkins.instance;
def descriptor = inst.getDescriptor(org.codefirst.SimpleThemeDecorator);

println "Desabilitando a segurança"
inst.disableSecurity();

println "Alterando tema para material design"
descriptor.cssUrl = "https://jenkins-contrib-themes.github.io/jenkins-material-theme/dist/material-indigo.css"
