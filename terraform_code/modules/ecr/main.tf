
#----------------------------------------------------------
# CLO835-assignment 1- Terraform Introduction
#
# Module to create  ECR Repository
#
#----------------------------------------------------------

#  Define the provider
provider "aws" {
  region = "us-east-1"
}

# Local variables
locals {
  default_tags = merge(
    var.default_tags,
    { "Env" = var.env }
  )
  name_prefix = "${var.prefix}-${var.env}"
}


resource "aws_ecr_repository" "repo" {
  name                 = local.name_prefix
  image_tag_mutability = var.image_tag_mutability
  image_scanning_configuration {
    scan_on_push = true
  }
}

