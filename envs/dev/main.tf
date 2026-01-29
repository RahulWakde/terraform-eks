module "vpc" {
source
vpc_name
vpc_cidr
= "../../modules/vpc"
= "dev-vpc"
= "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
azs
= ["ap-south-1a", "ap-south-1b"]
}
module "eks" {
source
cluster_name
subnets
= "../../modules/eks"
= "dev-eks"
= module.vpc.public_subnets
instance_type = "t3.medium"
}
module "nginx" {
source
= "../../modules/nginx"
endpoint = module.eks.endpoint
ca
= module.eks.ca
token
}
