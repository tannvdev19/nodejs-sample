variable "ec2_name" {
  type = string
  default = "nodejs-sample"
}

variable "ec2_instance_type" {
  type = string
  default = "t2.micro"
}

variable "ec2_ami" {
  type = string
  default = "ami-0acb5e61d5d7b19c8"
}

variable "ec2_key_name" {
  type = string
  default = "ec2_key"
}