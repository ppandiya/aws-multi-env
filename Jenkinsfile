// This is a pipeline

static isPullRequestFromFork(env) {
    return env?.getProperty('CHANGE_FORK') ? true : false
}

//def isPullRequestFromFork(jenkins.env)

 def runPipeline() {
   
   jenkins.echo ${jenkins.env}

if (isPullRequestFromFork) {
jenkins.echo "True"
}
   
 }
