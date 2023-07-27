resource "aws_key_pair" "ec2_key" {
  key_name   = var.ec2_key_name
  public_key = var.ec2_public_key
}
