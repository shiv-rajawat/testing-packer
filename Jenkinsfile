pipeline {
  agent any

  stages {

    stage('Checkout') {
        steps {
          checkout scm
        }
    }
    
    stage('Pre ELK Infra setup') {
        steps {
          dir("Pre-ELK"){
          sh "terraform init"
          sh "terraform apply -auto-approve"
           }
        }
    }
    
    

    stage('IAM Creation'){
      steps{
        sh "aws iam create-instance-profile --instance-profile-name packer || true"
        sh "aws iam add-role-to-instance-profile  --instance-profile-name packer --role-name packer || true"
        }
        
      }
    

    stage('AMI Creation') {
        steps {
          dir("packer"){
          sh "packer build -only=amazon-ebs -var-file=variables.json elasticsearch6-node.packer.json || true"
          sh "packer build -only=amazon-ebs -var-file=variables.json kibana6-node.packer.json || true"
           }
        }
    }

    stage('Apply terraform') {
        steps {
          dir ("terraform-aws"){
            sh "terraform init"
            sh "terraform plan"
            sh "terraform apply -auto-approve"
            sh "terraform output > /var/lib/jenkins/pipeline-output.txt"
            }
        }
    }

  }
}
