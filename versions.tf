
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20.0"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket = "terraform-tod-bucket"
    key = "myapp/state.tfstate"
    region = "us-east-1"
  }
}
