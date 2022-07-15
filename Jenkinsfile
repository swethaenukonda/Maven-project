pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
     environment {
        registry = '016003963452.dkr.ecr.us-east-1.amazonaws.com/dockerdemopipeline'
        registryCredential = 'jenkins-ecr-user'
        dockerimage = ''
    }	
    
    stages{
        stage("Checkout the project") {
           steps{
               git branch: 'master', url: 'https://github.com/devopscbabu/Java-Project.git'
           } 
        }
        stage("Build the package"){
            steps {
                sh 'mvn clean package'
            }
        }
		
        stage('Building the Image') {
        steps {
            script {
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
        stage ('Deploy the Image to Amazon ECR') {
        steps {
           script {
           docker.withRegistry("https://" + registry, "ecr:ap-south-1:" + registryCredential ) {
           dockerImage.push()
              }
           }
        }
     }
  }  
}
