pipeline {
    agent {
        label: 'ubuntu1'
    }



    stages {

        stage('checkout') {
            steps {
     
                checkout([$class: 'GitSCM', branches: [[name: '*/master']],
                    userRemoteConfigs: [[url: 'https://github.com/how2coding/Employee-management-System.git']]])
                sh "ls -lst"
            }
        }


        stage('build') {
            steps {
             
               sh "docker build -it Employee-management-System ."
            }
            
        }
        
        stage('run') {
          
            steps {
               sh "docker run --name Employee-management-System -p 8800:8081 -d Employee-management-System"
               
            }
            
        }
    }
}
