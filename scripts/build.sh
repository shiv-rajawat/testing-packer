#!/bin/bash
cd $PWD/Pre-ELK
terraform init -backend-config='region="${AWS_REGION}"'
terraform apply -var-file=../parameters/pre-elk-param.tfvars -auto-approve


cd ../IAM
terraform init -backend-config='region="${AWS_REGION}"'
terraform apply -var-file=../parameters/iam-param.tfvars -auto-approve



cd ../packer
packer build -only=amazon-ebs -var-file=variables.json elasticsearch6-node.packer.json || true
packer build -only=amazon-ebs -var-file=variables.json kibana6-node.packer.json || true

