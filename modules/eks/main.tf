# EKS Cluster Resource
resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = var.eks_cluster_role_arn # Uses the role ARN passed into the module

  vpc_config {
    subnet_ids              = var.subnet_ids # Uses the subnet IDs passed into the module
    endpoint_private_access = true
    endpoint_public_access  = false
  }

}


# EKS Worker Node Resources

# Launch template for the worker nodes to customize settings like disk size.
resource "aws_launch_template" "worker_nodes" {
  name_prefix   = "${var.cluster_name}-lt"
  instance_type = var.instance_types[0]

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.disk_size # Uses the disk_size variable
      volume_type           = "gp3"
      delete_on_termination = true
      encrypted             = true
    }
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.cluster_name}-worker-node"
    }
  }
}

# The managed node group that will run your Kubernetes pods.
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = var.eks_node_role_arn # Uses the node role ARN passed in
  subnet_ids      = var.subnet_ids        # Deploys nodes into the specified subnets

  launch_template {
    id      = aws_launch_template.worker_nodes.id
    version = aws_launch_template.worker_nodes.latest_version
  }

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name = "${var.cluster_name}-worker-node"
  }
}