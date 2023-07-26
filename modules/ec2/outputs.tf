output "ec2_public_ip" {
    value = aws_instance.ec2_server.public_ip  
}

output "ec2_public_dns" {
    value = aws_instance.ec2_server.public_dns
}

output "ec2_private_ip" {
    value = aws_instance.ec2_server.private_ip
}

output "ec2_private_dns" {
    value = aws_instance.ec2_server.private_dns
}

output "ssh_private_key" {
    value = tls_private_key.rsa.private_key_pem
}
