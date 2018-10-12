pipeline {
  agent any
  
  stages { 
    
    stage('Checkout') {
        steps {
          checkout scm        
        }
    }      
    stage('Test') {
        steps {
          sh "aws ec2 describe-instances"       
        }
    }    
    
  }
}
