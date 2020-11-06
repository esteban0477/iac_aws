terraform {
  backend "s3" {
    bucket  = "terraformstatejuan"
    key     = "eksdev/terraform.tfstate"
    region  = "us-east-2"
  }
}