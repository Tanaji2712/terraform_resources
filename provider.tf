terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # Specifies the version constraint
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}