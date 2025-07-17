resource "aws_eks_cluster" "this" {
  for_each                  = var.create ? toset(["eks"]) : toset([])
  name                      = var.name
  role_arn                  = var.role_arn
  version                   = var.cluster_version
  enabled_cluster_log_types = var.enabled_cluster_log_types

  vpc_config {
    security_group_ids      = var.vpc_config.security_group_ids
    subnet_ids              = var.vpc_config.subnet_ids
    endpoint_private_access = var.vpc_config.endpoint_private_access
    endpoint_public_access  = var.vpc_config.endpoint_public_access
    public_access_cidrs     = var.vpc_config.public_access_cidrs
  }

  dynamic "kubernetes_network_config" {
    # Not valid on Outposts
    for_each = var.kubernetes_network_config != null ? toset(["kubernetes_network_config"]) : toset([])
    content {
      ip_family         = var.kubernetes_network_config.ip_family
      service_ipv4_cidr = var.kubernetes_network_config.service_ipv4_cidr
      service_ipv6_cidr = var.kubernetes_network_config.service_ipv6_cidr
    }
  }

  dynamic "outpost_config" {
    for_each = var.outpost_config != null ? toset(["outpost_config"]) : toset([])
    content {
      control_plane_instance_type = outpost_config.value.control_plane_instance_type
      outpost_arns                = outpost_config.value.outpost_arns
    }
  }

  dynamic "encryption_config" {
    # Not available on Outposts
    for_each = var.encryption_config != null ? toset(["encryption_config"]) : toset([])
    content {
      provider {
        key_arn = encryption_config.value.key_arn
      }
      resources = encryption_config.value.resources
    }
  }
  tags = merge(
    var.tags,
    var.cluster_tags,
  )

}
