module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr = "10.0.0.0/16"
  azs      = ["ap-south-1a", "ap-south-1b"]

  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]
}

module "eks" {
  source = "../../modules/eks"

  cluster_name    = "dev-eks-cluster"
  cluster_version = "1.29"

  subnet_ids = module.vpc.private_subnet_ids
  vpc_id     = module.vpc.vpc_id
}

module "nginx" {
  source = "../../modules/nginx"

  kubeconfig_path = "~/.kube/config"
}
