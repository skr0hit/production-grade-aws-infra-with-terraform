# environments/dev/variables.tf

# This file declares the variables that the 'dev' environment needs.
# The actual values are set in terraform.tfvars.

variable "aws_region" {
  description = "The AWS region for this environment."
  type        = string
}

variable "environment" {
  description = "The name of the environment (e.g., dev, staging)."
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster for this environment."
  type        = string
}

variable "vpc_cidr_production" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
}

variable "instance_types" {
  description = "List of EC2 instance types for the worker nodes."
  type        = list(string)
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  type        = number
}

variable "disk_size" {
  description = "Disk size for worker nodes."
  type        = number
}