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

      stage('rm') {
           script {
               try {
                    steps {
                       
                       sh "docker kill emp-system "
                        sh "docker rm emp-system "
                    }
               
               } catch (Exception e) {
                   // execute if any exception is thrown
            }
        }
      }
        
        
          
        stage('run') {
          
            steps {
                 
               sh "docker run --name emp-system -p 8800:8081 -d emp-system"
               sh "newman run postman_collection.json"
            }
            
        }
         stage('test api') {
          
            steps {
                 
               sh "sleep 20"
               sh "newman run postman_collection.json"
            }
            
        }
    }
}
