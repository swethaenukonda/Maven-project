pipeline {
    agent any
    tools {
       maven 'M2_HOME'
    }
    environment {
        registry = '660181585180.dkr.ecr.eu-west-2.amazonaws.com/imagerepo'
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
                withSonarQubeEnv(installationName: 'Sonarscanner', credentialsId: 'SonarCloud') {
                 sh 'mvn clean package sonar:sonar'
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
        stage('Build the Image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }   
        }
        //stage('Deploy the image to Amazon ECR') {
        //    steps {
         //       script
       //         docker.WithRegistry("http://" + registry, "ecr:eu-west-2:" + registry credentails) {
        //            dockerImage.push()
      //    }
    //    }
   //   }
    }
}
