pipeline {
  agent any

  stages {

    stage('Checkout') {
        steps {
          checkout scm
        }
    }

    stage('IAM Creation'){
      steps{
        sh "aws iam create-instance-profile --instance-profile-name packer"
        sh "aws iam add-role-to-instance-profile  --instance-profile-name packer --role-name packer"
      }
    }

    stage('AMI Creation') {
        steps {
          dir("packer"){
          sh "packer build -only=amazon-ebs -var-file=variables.json elasticsearch6-node.packer.json"
          sh "packer build -only=amazon-ebs -var-file=variables.json kibana6-node.packer.json"
           }
        }
    }

    stage('Apply terraform') {
        steps {
          dir ("terraform-aws"){
            sh "terraform init"
            sh "terraform plan"

            }
        }
    }

  }
}
