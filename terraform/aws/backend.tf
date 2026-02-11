terraform {
  required_version = ">= 1.5.0"
  backend "s3" {
    bucket         = "poc-api-tf-state-druhin"
    key            = "api-platform/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
