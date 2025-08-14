# environments/dev/main.tf

provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "my-bucket-for-production-grade-terraform"
    key    = "dev/terraform.tfstate" # Environment-specific state path
    region = "ap-south-1"
    dynamodb_table = "my-eks-terraform-lock"
  }
}

module "vpc" {
  source = "../../modules/vpc"
  cluster_name         = var.cluster_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr_dev
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "iam" {
  source       = "../../modules/iam"
  cluster_name = var.cluster_name
}

module "eks" {
  source = "../../modules/eks"
  cluster_name         = var.cluster_name
  subnet_ids           = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  eks_node_role_arn    = module.iam.eks_node_role_arn
  instance_types       = var.instance_types
  desired_size         = var.desired_size
  max_size             = var.max_size
  min_size             = var.min_size
}