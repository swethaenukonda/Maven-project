pipeline {
   agent any
   tools {
     maven 'M2_HOME'
   }
  stages{
    stage('checkout the project') {
      steps {
        git branch: 'main', url: 'https://github.com/cbabu85/Java-Maven-Pipline.git'
      }
    }
    stage('Build'){
      steps {
        sh 'mvn clean compile'
      }
    }
    stage('Sonar Quality Analysis'){
      steps {
         script {
         withSonarQubeEnv(installationName: 'sonar-9', credentailsId: 'jenkins-sonar-token') {   
         sh 'mvn sonar:sonar'
                }
            }
        } 
     } 
  }  
   post {
      success{ 
         slackSend channel: 'devops-pipeline-demo', message: 'Pipeline Built Successfully'
      }
      failure {
         slackSend channel: 'devops-pipeline-demo', message: 'Pipeline Failed'
      }
   }    
}
