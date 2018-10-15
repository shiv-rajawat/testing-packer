terraform {
  backend "s3" {
    encrypt = true
    bucket = "bsk-terraform-state"
    dynamodb_table = "tf-state"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-2"
  }
}
