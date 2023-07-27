resource "aws_instance" "ec2_server" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  security_groups = [aws_security_group.allow_ssh_web.name]
  key_name = var.ec2_key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = var.ec2_name
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.rsa.private_key_pem
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "../bash-script/web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "/tmp/web.sh",
    ]
  }
}