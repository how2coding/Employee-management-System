pipeline {
    agent {
        label 'ubuntu1'
    }

  parameters {
      string 'mariapassword'
    }



    stages {

        stage('checkout') {
            steps {
     
                checkout([$class: 'GitSCM', branches: [[name: '*/master']],
                    userRemoteConfigs: [[url: 'https://github.com/how2coding/Employee-management-System.git']]])
                
                sh 'cat src/main/resources/application.properties | sed -i "s/{{mariapassword}}/${mariapassword}/g" src/main/resources/application.properties'
                sh "ls -lst"
            }
        }


        stage('build') {
            steps {
               sh "mvn install"
               sh "docker build -t emp-system ."
            }
            
        }
/*
      stage('rm') {
         
            steps {
               
               sh "docker kill emp-system "
                sh "docker rm emp-system "
            }

      }
    */    
        
          
        stage('run') {
          
            steps {
                 
               sh "docker run --name emp-system -p 8800:8081 -d emp-system"               
            }
            
        }
        
         stage('test api') {
          
            steps {
                 
               sh "sleep 60"
               sh "newman run p_collection.json"
            }
            
        }
        
    }
}
