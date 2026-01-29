provider "aws" {
  region = var.region
}

provider "helm" {
  # Note: Ensure there is NO equals sign after 'kubernetes'
  # but the internal fields must be correct.
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_ca)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
      command     = "aws"
    }
  }
}
