output "arn" {
  value  = aws_eks_node_group.this.arn
}
output "id" {
  value  = aws_eks_node_group.this.id 
}
output "resources" {
  value  = aws_eks_node_group.this.resources
}
output "tags_all" {
  value  = aws_eks_node_group.this.tags_all
}
output "status" {
  value  = aws_eks_node_group.this.status
}