variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}
variable "addon_name" {
  description = "The name of the addon_name cluster."
  type        = string
}

variable "name" {
  description = "The name of the EKS addon."
  type        = string
}
variable "tags" {
  description = "The name of the EKS addon."
  type        = map(string)
  default     = {}
}

variable "addon_version" {
  description = "The version of the EKS addon."
  type        = string
  default  = null
}

variable "service_account_role_arn" {
  description = "The ARN of the IAM role used by the EKS addon."
  type        = string
  default  = null
}

# variable "resolve_conflicts_on_update" {
#   description = "Whether to resolve conflicts on update."
#   type        = string
#   default     = "NONE"
# }

# variable "resolve_conflicts_on_create" {
#   description = "Whether to resolve conflicts on create."
#   type        = string
#   default     = "OVERWRITE"
# }

variable "preserve" {
  description = "Whether to preserve addon or not on delete."
  type        = bool
  default     = false
}

variable "resolve_conflicts" {
  type        = string
  default     = "OVERWRITE"
}

variable "configuration_values" {
  type        = any
  default  = null
}