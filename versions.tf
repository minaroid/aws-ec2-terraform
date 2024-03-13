
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20.0"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket = "terraform-myapp-bucket-500"
    key = "myapp/state.tfstate"
    region = "us-east-1"
  }
}
