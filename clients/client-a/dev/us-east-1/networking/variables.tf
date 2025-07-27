# variables.tf for networking
variable "environment" {
  type = any
}

variable "company" {
  type = any
}

variable "location" {
  type = any
}

variable "vpc" {
  type = map(object({
    cidr_block = string
    #   ipv4_ipam_pool_id                    = string
    #   ipv4_netmask_length                  = number
    #   assign_generated_ipv6_cidr_block     = bool
    #   ipv6_cidr_block                      = string
    #   ipv6_ipam_pool_id                    = string
    #   ipv6_netmask_length                  = number
    #   ipv6_cidr_block_network_border_group = string
    #   instance_tenancy                     = string
    #   enable_dns_hostnames                 = bool
    #   enable_dns_support                   = bool
    #   enable_network_address_usage_metrics = bool
  }))
}

variable "subnet" {
  type = map(object({
    vpc_name                = string
    map_public_ip_on_launch = bool
    availability_zone       = string
    cidr_block              = string
    # assign_ipv6_address_on_creation                = bool
    # availability_zone_id                           = string
    # enable_dns64                                   = bool
    # enable_resource_name_dns_aaaa_record_on_launch = bool
    # enable_resource_name_dns_a_record_on_launch    = bool
    # ipv6_cidr_block                                = string
    # ipv6_native                                    = bool
    # private_dns_hostname_type_on_launch            = string
    # name                                           = string
    # tags                                           = map(string)
  }))
}

variable "IGW" {
  description = "Map of internet gateways"
  type = map(object({
    vpc_name = string
  }))
}

# variable "public_rt" {
#   description = "Map of public_rt"
#   type = map(object({
#     vpc_name = string
#   }))
# }