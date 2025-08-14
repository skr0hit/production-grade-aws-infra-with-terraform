# modules/eks/variables.tf

variable "cluster_name" {
  description = "The name for the EKS cluster and associated resources."
  type        = string
}

variable "eks_cluster_role_arn" {
  description = "The IAM role ARN for the EKS cluster itself."
  type        = string
}

variable "eks_node_role_arn" {
  description = "The IAM role ARN for the EKS worker nodes."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the EKS cluster and nodes will be deployed."
  type        = list(string)
}

variable "instance_types" {
  description = "A list of EC2 instance types for the EKS worker nodes."
  type        = list(string)
  default     = ["t3.small"]
}

variable "desired_size" {
  description = "The desired number of worker nodes in the node group."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum number of worker nodes the node group can scale up to."
  type        = number
  default     = 2
}

variable "min_size" {
  description = "The minimum number of worker nodes the node group can scale down to."
  type        = number
  default     = 1
}

variable "disk_size" {
  description = "The disk size (in GB) for the EKS worker nodes."
  type        = number
  default     = 50
}
