resource "aws_route_table" "this" {
  for_each         = var.create ? toset(["table"]) : toset([])
  vpc_id           = var.vpc_id
  propagating_vgws = var.propagating_vgws
  tags = merge(
    { "Name" = "${var.name}" },
    var.tags,
  )
}
