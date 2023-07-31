pipeline {
    agent any 
 tools{
     maven 'M2_HOME'
 }
    stages {
        stage('checkout from git') { 
            steps {
              git branch: 'main', url:  'https://github.com/swethaenukonda/addressbook.git'
            }
        }
        stage('build using maven') { 
            steps {
                 sh 'mvn clean package'
            }
        }
        stage('build the docker image') { 
            steps {
                 sh 'docker build -t  addressbook.war  .'
            }
        }

            
        }
    }
