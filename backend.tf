terraform {
  backend "s3" {
    bucket         = "terraform-state-eks-mahesh-2026"
    key            = "eks/dev/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
