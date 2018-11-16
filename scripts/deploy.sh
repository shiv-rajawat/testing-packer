#!/bin/bash

cd $PWD/terraform-aws
vpcname=${ELK_VPC_NAME}
echo "$vpcname"
vpcid=$(aws ec2 describe-vpcs --query "Vpcs[?Tags[?Key=='Name']|[?Value=='$vpcname']].VpcId" --region ${AWS_REGION} --output text)
size=${#vpcid}
echo "$size"
echo "$vpcid"
terraform init -backend-config="region=${AWS_REGION}"
#terraform plan -var "vpc_id=$vpcid" -var-file=../parameters/es-cluster-param.tfvars
terraform apply -var "access_key=$AWS_ACCESS_KEY_ID" -var "secret_key=$AWS_SECRET_ACCESS_KEY" -var "vpc_id=$vpcid" -var-file=../parameters/es-cluster-param.tfvars -auto-approve
terraform output > /var/lib/jenkins/pipeline-output.txt



#### Destroying everything

#terraform destroy -var "vpc_id=$vpcid" -var-file=../parameters/es-cluster-param.tfvars -auto-approve

#cd ../IAM
#terraform destroy -var-file=../parameters/iam-param.tfvars -auto-approve

#cd ../Pre-ELK
#terraform destroy -var-file=../parameters/pre-elk-param.tfvars -auto-approve
