output "vpc_ids" {
  value = {
    for k, v in module.vpc : k => v.id
  }
}

output "subnet_ids" {
  value = {
    for k, v in module.subnet : k => v.id
  }
}
