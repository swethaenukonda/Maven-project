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
  }      
}
