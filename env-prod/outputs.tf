output "ecr_repo_url" {
  value       = module.prod_ecr.ecr_repo_url
  description = "The ECR repository URL"
}