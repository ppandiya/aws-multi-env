// This is a pipeline

static isPullRequestFromFork(env) {
    return env?.getProperty('CHANGE_FORK') ? true : false
}

//def isPullRequestFromFork(jenkins.env)

 def runPipeline() {
     
     checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ppandiya/aws-multi-env.git']]])

   
   jenkins.echo ${jenkins.env}

if (isPullRequestFromFork) {
jenkins.echo "True"
}
   
 }
