variable "name" {
  tpye = string
}
variable "subnet_ids" {
  tpye = any
}
variable "name_prefix" {
  tpye = string
  default = null
}
variable "description" {
  tpye = string
  default = null
}
variable "tags" {
  tpye = map(string)
  default = {}
}
