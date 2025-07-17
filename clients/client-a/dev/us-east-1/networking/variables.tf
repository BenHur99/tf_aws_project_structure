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
  }))
}

variable "subnets" {
  type = map(object({
    cidr_block = string
    vpc_name   = string
    az         = string
    public     = bool
  }))
}

variable "igw" {
  description = "Map of internet gateways"
  type = map(object({
    vpc_name = string
  }))
}

variable "public_rt" {
  description = "Map of public_rt"
  type = map(object({
    vpc_name = string
  }))
}