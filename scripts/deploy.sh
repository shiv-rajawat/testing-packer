#!/bin/bash

cd $PWD/terraform-aws
vpcname=${ELK_VPC_NAME}
vpcid=$(aws ec2 describe-vpcs --query "Vpcs[?Tags[?Key=='Name']|[?Value=='$vpcname']].VpcId" --region ${AWS_REGION} --output text)
terraform init -backend-config="region=${AWS_REGION}"
#terraform plan -var "vpc_id=$vpcid" -var-file=../parameters/es-cluster-param.tfvars
terraform apply -var "vpc_id=$vpcid" -var-file=../parameters/es-cluster-param.tfvars -auto-approve
terraform output > /var/lib/jenkins/pipeline-output.txt



#### Destroying everything

terraform destroy -var "vpc_id=$vpcid" -var-file=../parameters/es-cluster-param.tfvars -auto-approve

cd ../IAM
terraform destroy -var-file=../parameters/iam-param.tfvars -auto-approve

cd ../Pre-ELK
terraform destroy -var-file=../parameters/pre-elk-param.tfvars -auto-approve
