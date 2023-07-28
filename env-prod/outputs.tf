output "ecr_repo_url" {
  value       = module.prod_ecr.ecr_repo_url
  description = "The ECR repository URL"
}


output "ec2_public_ip" {
  value       = module.prod_ec2.ec2_public_ip
  description = "The EC2 public IP"
}

output "ec2_public_dns" {
  value       = module.prod_ec2.ec2_public_dns
  description = "The EC2 public DNS"
}