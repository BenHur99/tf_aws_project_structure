variable "create" {
  description = "Flag to determine whether to create the EKS cluster"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "role_arn" {
  description = "ARN of the IAM role for the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Version of the EKS cluster"
  type        = string
}

variable "enabled_cluster_log_types" {
  description = "Enabled log types for the EKS cluster"
  type        = list(string)
}

variable "vpc_config" {
  description = "VPC configuration for the EKS cluster"
  type        = any
}

variable "kubernetes_network_config" {
  description = "Kubernetes network configuration for the EKS cluster"
  type        = any
  default     = null
}

variable "outpost_config" {
  description = "Outpost configuration for the EKS cluster"
  type        = any
  default     = null
}

variable "encryption_config" {
  description = "Encryption configuration for the EKS cluster"
  type        = any
  default     = null
}

variable "tags" {
  description = "Additional tags for the EKS cluster"
  type        = map(string)
  default     = {}
}

variable "cluster_tags" {
  description = "Additional tags specific to the cluster for the EKS cluster"
  type        = map(string)
  default     = {}
}
