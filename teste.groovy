import org.jenkinsci.plugins.workflow.job.*
import org.jenkinsci.plugins.workflow.*
import hudson.plugins.git.*

def nome = "exercitando"
def inst = Jenkins.instance;

def scm = new GitSCM("https://github.com/dharlanoliveira/spring-boot-rest-example.git");
scm.branches = [new BranchSpec("*/master")];

def job = new WorkflowJob(inst,nome)
job.definition = new CpsScmFlowDefinition(scm, "workflow-job");

inst.add(job,nome)