terraform {
  backend "s3" {
    encrypt = true
    bucket = "cwt-terraform-remote-state-bucket"
    dynamodb_table = "cwt-terraform-state-lock"
    key    = "global/s3/pre-elk-terraform.tfstate"
    region = "us-east-2"
  }
}
