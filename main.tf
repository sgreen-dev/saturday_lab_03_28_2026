terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.38.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "3.2.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "http" "local_ip" {
  url = "https://checkip.amazonaws.com/"
}

data "aws_availability_zones" "available" {
  state = "available"
}