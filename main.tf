module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source = "./modules/eks"

  cluster_name  = "demo-eks"
  subnets       = module.vpc.public_subnets
  instance_type = "t3.medium"
}


data "aws_eks_cluster" "this" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  token                  = data.aws_eks_cluster_auth.this.token
  cluster_ca_certificate = base64decode(
    data.aws_eks_cluster.this.certificate_authority[0].data
  )
}

module "nginx" {
  source = "./modules/nginx"
}
