#!/bin/bash
cd $PWD/Pre-ELK
echo $HOME
echo $PWD
ls -l
terraform init
terraform apply -var-file=../parameters/pre-elk-param.tfvars -auto-approve

cd ../IAM
terraform init
terraform apply -auto-approve

cd ../packer
packer build -only=amazon-ebs -var-file=variables.json elasticsearch6-node.packer.json || true
packer build -only=amazon-ebs -var-file=variables.json kibana6-node.packer.json || true

cd ../terraform-aws
vpcid=$(aws ec2 describe-vpcs --query "Vpcs[?Tags[?Key=='Name']|[?Value=='cpv-vpc']].VpcId" --region us-east-2 --output text)
terraform init
terraform plan -var 'vpc_id=${vpcid}' -var-file=../parameters/es-cluster-param.tfvars
terraform apply -var 'vpc_id=${vpcid}' -var-file=../parameters/es-cluster-param.tfvars -auto-approve
terraform output > /var/lib/jenkins/pipeline-output.txt
terraform destroy -var 'vpc_id=${vpcid}' -var-file=../parameters/es-cluster-param.tfvars -auto-approve

cd ../IAM
terraform destroy -auto-approve

cd ../Pre-Elk
terraform desroy -var-file=../parameters/pre-elk-param.tfvars -auto-approve
