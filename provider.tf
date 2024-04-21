terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=5.43.0, <5.45.0, !=5.43.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.6.1"
    }
  }
  required_version = "~>1.8.1"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
}
