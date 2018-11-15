#!/bin/bash
aws s3 ls
terraform version
cd $PWD/Pre-ELK
terraform init -backend-config="region=${AWS_REGION}"
terraform apply -var "access_key=$AWS_ACCESS_KEY_ID" -var "secret_key=$AWS_SECRET_ACCESS_KEY" -var-file=../parameters/pre-elk-param.tfvars -auto-approve


cd ../IAM
terraform init -backend-config="region=${AWS_REGION}"
terraform apply -var "access_key=$AWS_ACCESS_KEY_ID" -var "secret_key=$AWS_SECRET_ACCESS_KEY" -var-file=../parameters/iam-param.tfvars -auto-approve



cd ../packer
packer build -only=amazon-ebs -var-file=variables.json elasticsearch6-node.packer.json || true
packer build -only=amazon-ebs -var-file=variables.json kibana6-node.packer.json || true

