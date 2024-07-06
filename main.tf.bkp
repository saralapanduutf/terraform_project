terraform {
  backend "s3" {
    bucket = "terraform-backend-file-5689"
    key    = "state/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-staging"
    encrypt        = true
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
module "vpc" {
  source                             = "./modules/VPC"
  environment                        = var.environment
  vpc_cidr                           = "10.6.0.0/16"
  vpc_azs                            = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_private_subnets                = ["10.6.1.0/24", "10.6.2.0/24", "10.6.3.0/24"]
  vpc_public_subnets                 = ["10.6.101.0/24", "10.6.102.0/24", "10.6.103.0/24"]
  vpc_database_subnets               = ["10.6.7.0/24", "10.6.8.0/24", "10.6.9.0/24"]
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  enable_nat_gateway                 = false
  single_nat_gateway                 = false
  enable_dns_hostnames               = true
  enable_dns_support                 = true
  tags                               = var.tags
}


#module "ec2" {
#  source                = "./modules/ec2"
#  environment           = var.environment
#  vpc_id               = module.vpc.vpc_id
#  vpc_public_subnet     = module.vpc.vpc_public_subnets[0]  
#  vpc_private_subnet    = module.vpc.vpc_private_subnets[0]
#  key_name              = var.key_name
#}
