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
    stage('Package'){
      steps {
        sh 'mvn clean package'
      }
    }
//    stage('Sonar Quality Analysis'){
//      steps {
//         script {
//         withSonarQubeEnv(installationName: 'sonar-9', credentailsId: 'jenkins-sonar-token') {   
//         sh 'mvn sonar:sonar'
//                }
//             timeout(time: 1, unit: 'HOURS') {
//              def qg = waitForQualityGate()
//              if (qg.status != 'OK') {
 //                 error "Pipeline aborted due to quality gate failure: ${qg.status}"
             
//                    }
//                }
//            }
 //       } 
//     }
     stage('Build the Docker Image'){
      steps {
         script {
        dockerImage = docker.build registry + ":$BUILD_NUMBER"
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
