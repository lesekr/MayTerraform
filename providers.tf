#define your region
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "172.31.0.0/16"
}

#create s3 bucket
resource "aws_s3_bucket" "ekrissinbucketmay" {
  bucket = var.bucketname

  tags = {
    Name        = "ekrissinbucketmay23"
    Environment = "project_20"
  }
}