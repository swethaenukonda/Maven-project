pipeline {
    agent any
    tools {
        maven 'M2_HOME'
    }
    stages {
        stage('checkout the project') {
            steps {
                git branch: 'main', url: 'https://github.com/cbabu85/Java-Maven-Pipline.git'
            }
        }
        stage('Build the Package') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('SonarQube Quality Checks') {
            steps {
                withSonarQubeEnv(installationName: 'sonar-9' , credentialsId: 'jenkins-sonar-token') {
                sh 'mvn sonar:sonar'
                  }
        
               }
            }
          }
       }
