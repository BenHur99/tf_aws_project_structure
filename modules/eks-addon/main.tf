resource "aws_eks_addon" "this" {
  cluster_name                = var.cluster_name
  addon_name                  = var.addon_name
  addon_version               = var.addon_version
  service_account_role_arn    = var.service_account_role_arn
  resolve_conflicts           = var.resolve_conflicts
  # resolve_conflicts_on_update = var.resolve_conflicts_on_update
  # resolve_conflicts_on_create = var.resolve_conflicts_on_create
  preserve                    = var.preserve
  configuration_values = var.configuration_values != null ? jsonencode({
    replicaCount = var.configuration_values.replicaCount
    resources = {
      limits = {
        cpu    = var.configuration_values.limits.cpu
        memory = var.configuration_values.limits.memory
      }
      requests = {
        cpu    = var.configuration_values.requests.cpu
        memory = var.configuration_values.requests.memory
      }
    }
  }) : null
  tags = merge(
    { "Name" = "${var.name}" },
    var.tags,
  )
}
