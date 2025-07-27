# main.tf for networking
# =======================
locals {
  name-prefix = {
    environment = var.environment
    company     = var.company
  }
  prefix = "${var.company}-${var.environment}"
}

# VPCs
# ======
module "vpc" {
  source     = "../../../../../modules/vpc"
  for_each   = var.vpc
  name       = "${each.key}-${local.prefix}"
  cidr_block = each.value.cidr_block
  tags = {
    Name        = "${each.key}-${local.prefix}"
    Environment = var.environment
    Company     = var.company
  }
}

# Subnets
# ========
module "subnet" {
  source                  = "../../../../../modules/subnet"
  for_each                = var.subnet
  name                    = "${each.key}-${local.prefix}"
  vpc_id                  = module.vpc[each.value.vpc_name].id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags = {
    Name        = "${each.key}-${local.prefix}"
    Environment = var.environment
    Company     = var.company
  }
}

# IGWs
# ========
module "IGW" {
  source   = "../../../../../modules/aws-internet-gateway"
  for_each = var.IGW
  name     = "${each.key}-${local.prefix}"
  vpc_id   = module.vpc[each.value.vpc_name].id
  tags = {
    Name = "igw-${local.prefix}"
  }
}