terraform {
  backend "s3" {
    encrypt = true
    bucket = "shiv-terraform-remote-state-bucket"
    dynamodb_table = "shiv-terraform-state-lock"
    key    = "global/s3/elk-terraform.tfstate"
  }
}
