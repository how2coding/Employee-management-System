pipeline {
    agent any



    stages {

        stage('checkout') {
            steps {
     
                checkout([$class: 'GitSCM', branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: 'https://github.com/how2coding/Employee-management-System.git']]])
                sh "ls -lst"
            }
        }


        stage('build') {
            steps {
             
               sh "echo build"
            }
            
        }
        
        stage('deploy') {
          
            steps {
               sh "echo deploy"
               
            }
            
        }
    }
}
