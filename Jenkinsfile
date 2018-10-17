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
          sh "terraform init -backend-config="region=us-east-2"
          sh "terraform apply -var-file=../parameters/pre-elk-param.tfvars -auto-approve"
            }
        }
    }



    stage('IAM Creation'){
      steps{
        dir("IAM"){
          sh "terraform init"
          sh "terraform apply -auto-approve"
        }
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
           script{
           vpcid = sh (returnStdout: true, script:'aws ec2 describe-vpcs --query "Vpcs[?Tags[?Key==\'Name\']|[?Value==\'cpv-vpc\']].VpcId" --region us-east-2 --output text').trim()
           }
            sh "terraform init"
            sh "terraform plan -var 'vpc_id=${vpcid}' -var-file=../parameters/es-cluster-param.tfvars"
            sh "terraform apply -var 'vpc_id=${vpcid}' -var-file=../parameters/es-cluster-param.tfvars -auto-approve"
            sh "terraform output > /var/lib/jenkins/pipeline-output.txt"
            sh "terraform destroy -var 'vpc_id=${vpcid}' -var-file=../parameters/es-cluster-param.tfvars -auto-approve"

            }
        }
    }
  }
}
