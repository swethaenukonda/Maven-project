pipeline {
    agent any 
 tools{
     maven 'M2_HOME'
 }
    stages {
        stage('checkout from git') { 
            steps {
              git branch: 'main', url:  'https://github.com/swethaenukonda/Maven-project.git'
            }
        }
        stage('build using maven') { 
            steps {
                 sh 'mvn clean package'
            }
        }
            }
        }

            
        
    
