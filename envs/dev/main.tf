module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = var.vpc_cidr
}

module "eks" {
  source           = "../../modules/eks"
  subnet_ids       = module.vpc.private_subnets
  cluster_name     = var.cluster_name
  instance_types   = var.instance_types
  desired_capacity = var.desired_capacity
}

module "nginx" {
  source     = "../../modules/nginx"
  depends_on = [module.eks]
}
