Jenkinsfile (Declarative Pipeline)
// Execution on Declarative can always be resumed after an interruption
pipeline {

   agent any
// agent {
       // we will use a VM as a Jenkins agent, with all utilities neeed to deploy (example AWS CLI, ...)
       // TODO
//     docker { image 'node:16.13.1-alpine' }
// }

   stages {
      stage('Example') {
         steps {
             echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL} on node ${env.NODE_NAME} with jobname ${env.JOB_NAME} on workspace ${env.WORKSPACE}"
             sh 'pwd'
             sh 'ls -lah'
         }
      }


   }

}

// buildDiscarder !!!
