variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "port" {
  type = number
}

variable "protocol" {
  type = string
}

variable "protocol_version" {
  type = string
}

variable "target_type" {
  type = string
}

variable "connection_termination" {
  type = string
}

variable "deregistration_delay" {
  type = number
}

variable "slow_start" {
  type = number
}

variable "proxy_protocol_v2" {
  type = bool
}

variable "lambda_multi_value_headers_enabled" {
  type = bool
}

variable "load_balancing_algorithm_type" {
  type = string
}

variable "preserve_client_ip" {
  type = bool
}

variable "ip_address_type" {
  type = string
}

variable "load_balancing_cross_zone_enabled" {
  type = bool
}

variable "health_check" {
  type = map(any)
  default = null
}

variable "stickiness" {
  type = map(any)
  default = null
}

variable "tags" {
  type = map(any)
  default = {}
}