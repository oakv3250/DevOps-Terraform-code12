data "aws_ami" "example" {
  executable_users = ["self"]
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*-x86_64-ebs"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_instance" "ec21" {
  instance_id = "i-0f745308e7c4c8970"
}
resource "aws_instance" "demo" {
  ami = data.aws_instance.ec21.ami
  instance_type = data.aws_instance.ec21.instance_type
  key_name = data.aws_instance.ec21.key_name
}