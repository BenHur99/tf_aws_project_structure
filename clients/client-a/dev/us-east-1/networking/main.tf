# main.tf for networking
locals {
  name-prefix = {
    environment = var.environment
    company     = var.company
  }
  prefix = "${var.company}-${var.environment}"
}

module "vpc" {
    source = "../../../../../modules/vpc"
    for_each = var.vpc
    
}