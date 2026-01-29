variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "subnets" {
  description = "Subnet IDs for EKS"
  type        = list(string)
}

variable "instance_type" {
  description = "Worker node instance type"
  type        = string
}
