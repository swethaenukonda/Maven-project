pipeline {
   agent any
   tools {
     maven 'M2_HOME'
   }
   environment {
      registry = '107414687854.dkr.ecr.ap-south-1.amazonaws.com/demoimagerepo'
      registryCredential = 'Jenkins-ecr-login-credentails'
     
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
//     stage('Build the Docker Image'){
//      steps {
//         script {
//        dockerImage = docker.build registry + ":$BUILD_NUMBER"
//            }
//        }
//     }
//     stage('Push the Docker Image to ECR'){
//      steps {
//         script {
//         docker.withRegistry("http://" + registry, "ecr:ap-south-1:" + registryCredential) { 
 //        dockerImage.push()
//                            }
//                     }
//               }
//        }
     stage('Ansible Deploy'){
      steps {
         ansiblePlaybook credentialsId: 'deploy-server', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dev.inv', playbook: 'deploy-docker.yml'
            }
       }
  }   
                 
 //  post {
 //     success{ 
 //        slackSend channel: 'devops-pipeline-demo', message: 'Pipeline Built Successfully'
//      }
//      failure {
//         slackSend channel: 'devops-pipeline-demo', message: 'Pipeline Failed'
 //     }
//   }    
}
