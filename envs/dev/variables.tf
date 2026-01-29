variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "cluster_name" {
  type        = string
  description = "EKS Cluster Name"
}

variable "instance_types" {
  type        = list(string)
  description = "EKS Node instance types"
}

variable "desired_capacity" {
  type        = number
  description = "Number of nodes"
}
