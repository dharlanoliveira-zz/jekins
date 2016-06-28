import jenkins.model.*;
import hudson.model.*;
import com.cloudbees.hudson.plugins.folder.*

def inst = Jenkins.instance;
println "Desabilitando a segurança"
inst.disableSecurity();
println "Desabilitando executores no master"
inst.setNumExecutors(1);

println "Configurando e-mail global"
def config = JenkinsLocationConfiguration.get()
config.setAdminAddress("jenkins@tcu.gov.br")

def locationConfig = JenkinsLocationConfiguration.get()
locationConfig.setAdminAddress("jenkins@tcu.gov.br")

def descGitPlugin = inst.getDescriptor("hudson.plugins.git.GitSCM")

descGitPlugin.setGlobalConfigName("Jenkins TCU")
descGitPlugin.setGlobalConfigEmail("jenkins@tcu.gov.br")

descGitPlugin.save()

//inst.descriptor.all() - obter todos os descritores
println "Alterando tema para material design"
def descriptor = inst.getDescriptor(org.codefirst.SimpleThemeDecorator);
descriptor.cssUrl = "https://jenkins-contrib-themes.github.io/jenkins-material-theme/dist/material-indigo.css"

def admin = inst.createProject(Folder,'admin');

println "Criando job (com Job DSL Plugin) respoansável por montar todas as builds"
def nomeCriarJob = "criar-todos-jobs"
def criarJobXml = new File('/var/jenkins_home/criar-todos-jobs-config.xml').getText('UTF-8')

def criarJobXmlStream = new ByteArrayInputStream( criarJobXml.getBytes() )

def criarJob = admin.createProjectFromXML(nomeCriarJob, criarJobXmlStream)


println "Criando job para excluir slaves fantasmas"
def nomeExcluirJob = "excluir-slaves-fantasmas-jobs"
def excluirJobXml = new File('/var/jenkins_home/excluir-slaves-fantasmas-config.xml').getText('UTF-8')

def excluirJobXmlStream = new ByteArrayInputStream( excluirJobXml.getBytes() )

def excluirJob = admin.createProjectFromXML(nomeExcluirJob, excluirJobXmlStream)


//inst.add(admin,'admin')
admin.save()
criarJob.save();
excluirJob.save();
inst.save()

println "Forçar execução de job de criação de projetos"
def projetoCriacao = inst.getItemByFullName('admin/criar-todos-jobs')
inst.queue.schedule(projetoCriacao)
