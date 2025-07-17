variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "name" {
  description = "The name of the EKS node group"
  type        = string
}

variable "instance_types" {
  description = "A list of instance types for the EKS node group"
  type        = list(string)
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the EKS node group"
  type        = list(string)
}

variable "ami_type" {
  description = "The type of Amazon Machine Image (AMI) for the EKS node group"
  type        = string
  default     = null

}

variable "capacity_type" {
  description = "The capacity type for the EKS node group"
  type        = string
  default     = null
}
variable "update_config" {
  type        = any
  default     = null
}

variable "disk_size" {
  description = "The disk size in GiB for the EKS node group instances"
  type        = number
  default     = null
}

variable "force_update_version" {
  description = "Flag to indicate whether to force the update of Kubernetes version for the EKS node group"
  type        = bool
  default     = false
}

variable "labels" {
  description = "A map of Kubernetes labels to assign to the EKS node group"
  type        = map(string)
  default     = {}
}

variable "release_version" {
  description = "The desired Kubernetes version for the EKS node group"
  type        = string
  default     = null
}
variable "node_role_arn" {
  type        = string
  default     = null
}

variable "scaling_config" {
  description = "Scaling configuration for the EKS node group"
  type        = any
}

variable "taint" {
  description = "Taint configuration for the EKS node group"
  type        = any
  default     = null
}

variable "launch_template" {
  description = "Launch template configuration for the EKS node group"
  type        = any
  default     = null
}

variable "remote_access" {
  description = "Remote access configuration for the EKS node group"
  type        = any
  default     = null
}

variable "tags" {
  description = "Additional tags to assign to the EKS node group"
  type        = map(string)
  default     = {}
}
