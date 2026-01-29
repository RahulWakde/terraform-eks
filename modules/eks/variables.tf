variable "cluster_name" {}
variable "subnet_ids" { type = list(string) }
variable "instance_types" { default = ["t3.medium"] }
variable "desired_capacity" { default = 2 }
