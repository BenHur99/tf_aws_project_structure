
resource "aws_eks_node_group" "this" {
  cluster_name         = var.cluster_name
  node_group_name      = var.name
  instance_types       = var.instance_types
  node_role_arn        = var.node_role_arn
  subnet_ids           = var.subnet_ids
  ami_type             = var.ami_type
  capacity_type        = var.capacity_type
  disk_size            = var.disk_size
  force_update_version = var.force_update_version
  labels               = var.labels
  release_version      = var.release_version


  scaling_config {
    desired_size = var.scaling_config.desired_size
    min_size     = var.scaling_config.min_size
    max_size     = var.scaling_config.max_size
  }

  dynamic "taint" {
    for_each = var.taint != null ? toset(["taint"]) : toset([])
    content {
      key    = lookup(ingress.value, "key", null)
      value  = lookup(ingress.value, "value", null)
      effect = lookup(ingress.value, "effect", "NO_SCHEDULE")
    }
  }
  dynamic "launch_template" {
    for_each = var.launch_template != null ? toset(["launch_template"]) : toset([])
    content {
      name    = lookup(launch_template.value, "name", null)
      version = lookup(launch_template.value, "version", "default_version")
    }
  }
  dynamic "remote_access" {
    for_each = var.remote_access != null ? toset(["remote_access"]) : toset([])
    content {
    ec2_ssh_key               = var.remote_access.ec2_ssh_key
    source_security_group_ids = var.remote_access.source_security_group_ids
    }
  }
  dynamic "update_config" {
    for_each = var.update_config != null ? toset(["update_config"]) : toset([])
    content {
      max_unavailable            = lookup(update_config.value, "max_unavailable", null)
      max_unavailable_percentage = lookup(update_config.value, "max_unavailable_percentage", null)
    }
  }


  tags = merge(
    { "Name" = "${var.name}" },
    var.tags,
  )
}
