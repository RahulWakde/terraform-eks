terraform {
  backend "s3" {
    bucket         = "your-unique-tfstate-bucket"
    key            = "dev/eks.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}
