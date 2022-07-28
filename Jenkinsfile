pipeline {
    agent any
    tools {
       maven 'M2_HOME'
    }
    environment {
        registry = '660181585180.dkr.ecr.eu-west-2.amazonaws.com/imagerepo'
        resistryCredentials = 'jenkins-ecr-login-credentials'
        dockerImage = ''
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                echo 'hi'
            }
        }
        stage ('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/devopscbabu/Java-Project.git']]])
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package  -DskipTests'
            }
        }
        stage('sonarqube checks') {
            steps {
                script {
        //        withSonarQubeEnv(installationName: 'Sonarscanner', credentialsId: 'SonarCloud') {
       //           withSonarQubeEnv(credentialsId: 'sonarkey', installationName: 'SonarCloud') {
        //            withSonarQubeEnv(credentialsId: 'sonarkey') {
        //         sh 'mvn -B verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=devopsjava'
        //         sh   'mvn compile org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=devopsjava -Dsonar.login=sonarkey'
                   withSonarQubeEnv(credentialsId: '0943cf67f0a6be1be44b09bc', installationName: 'SonarCloud') { // You can override the credential to be used
                   sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
                 
                 }
                    timeout(time: 3, unit: 'MINUTES') {
                       def qg = waitForQualityGate()
                    if (qg.status != 'OK') {
                       error "Pipeline aborted due to quality gate failure: ${qg.status}"
                        }
                }
           }
        }
   }
 //       stage('Build the Image') {
//            steps {
//                script {
//                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
//                }
 //           }   
 //       }
//        stage('Deploy the image to Amazon ECR') {
//            steps {
//                script {
//                docker.withRegistry("http://" + registry, "ecr:eu-west-2:" + resistryCredentials) {
//                dockerImage.push()
 //         }
//        }
//      }
//    }
  }
 //   post { 
 //       success { 
 //           mail bcc: '', body: 'Pipeline Build is Successfully Executed', cc:'', from: 'devopsuser12@gmail.com', replyTo: '', subject: ' The Pipeline is Success', to: 'devopsuser12@gmail.com' 
 //       }
//        failure {
//            mail bcc: '', body: 'Pipeline Build is Failed while Executing', cc:'', from: 'devopsuser12@gmail.com', replyTo: '', subject: ' The Pipeline is Failure', to: 'devopsuser12@gmail.com'
 //       }
 //   }
}
