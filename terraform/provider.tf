// Required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.36.0"
    }
  }
}

// Variables - pull from terraform.tfvars
variable "region" {
  type = string
}

// Set aws provider - using cli
provider "aws" {
  region = var.region
}