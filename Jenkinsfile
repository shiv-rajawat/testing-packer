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
          dir("packer"){
          sh "packer build -only=amazon-ebs -var-file=variables.json elasticsearch6-node.packer.json"
          sh "packer build -only=amazon-ebs -var-file=variables.json kibana6-node.packer.json"   }  
        }
    }

  }
}
