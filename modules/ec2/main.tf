resource "aws_instance" "ec2_server" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  security_groups = [aws_security_group.allow_ssh_web.name]
  key_name = aws_key_pair.ec2_key.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = var.ec2_name
  }


  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo yum update -y"
  #   ]

  #   connection {
  #     type        = "ssh"
  #     user        = "ec2-user"
  #     private_key = file("private_key")
  #     host        = self.public_ip
  #   }
  # }
  
   provisioner "local-exec" {
    command    = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user --key-file private_key -T 600 -i '${self.public_ip},',  ../playbook.yaml"
    on_failure = fail
  }
}