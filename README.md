# testing-packer
This repository contains code to automate setting up of an ELK stack on a cluster of EC2 servers. Their deployment is then automated using jenkinsfile. The process involves the following steps.

1. Pre-ELK contains the code to deploy necessary networking infrastructure like VPC, SGs, IGs etc.
2. IAM is responsible in creating the required IAM roles and key to be used by packer while building AMIs.
3. packer is used to build 2 AMIs, one with elasticsearch and the other with Kibana in it.
4. terraform-aws uses the AMIs created to deploy a cluster of servers with Elasticsearch and Kibana on them.
5. Modules contain ready-made terraform code to deploy any service. In most of the places we have called the modules to deploy any resource.

Using with Jenkins:

The Jenkinsfile contain all the flow of the execution. It takes variables from pipeline-vars.groovy and use scripts inside scripts folder to execute them.
