provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Project     = "Cloud-Native-API-POC"
      Environment = "Production-Style"
    }
  }
}
