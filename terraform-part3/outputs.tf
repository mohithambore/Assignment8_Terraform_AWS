output "flask_repository_url" {
  value = aws_ecr_repository.flask_repo.repository_url
}

output "express_repository_url" {
  value = aws_ecr_repository.express_repo.repository_url
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}

output "frontend_security_group_id" {
  value = aws_security_group.frontend_sg.id
}

output "backend_security_group_id" {
  value = aws_security_group.backend_sg.id
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}