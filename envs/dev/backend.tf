terraform {
  backend "s3" {
    bucket         = "terraform-state-eks-mahesh-2026"
    key            = "dev/eks.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}
