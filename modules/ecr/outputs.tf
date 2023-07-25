output "ecr_repo_url" {
  value = aws_ecr_repository.ecr_repo.repository_url
  description = "The ECR repository URL"
}