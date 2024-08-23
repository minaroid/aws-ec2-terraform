
provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/aws-vpc"
  cidr_blocks = var.vpc_cidr_blocks  
  availability_zones = var.availability_zones  
}

module "security_groups" {
  source = "./modules/aws-security-groups"
  depends_on = [module.vpc]
  vpc = module.vpc
}

module "aws-ec2-instances" {
   source = "./modules/aws-ec2-instances"  
   depends_on = [module.vpc, module.security_groups]
   security_groups = module.security_groups
   vpc = module.vpc
   ssh_public_key_location = var.ssh_public_key_location
   availability_zones = var.availability_zones
}

