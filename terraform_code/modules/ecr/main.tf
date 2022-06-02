
#----------------------------------------------------------
# CLO835-assignment 1- Containers  Introduction
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
  _name       = var.use_fullname 
  image_names = length(var.image_names) > 0 ? var.image_names : [local._name]
}


resource "aws_ecr_repository" "repo" {
  for_each             = toset(var.enabled ? local.image_names : [])
  name                 = each.value
  image_tag_mutability = var.image_tag_mutability
  image_scanning_configuration {
    scan_on_push = true
  }
}

