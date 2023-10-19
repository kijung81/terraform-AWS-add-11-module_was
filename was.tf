data "aws_ami" "al2" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["*amzn2-ami-hvm*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "was1" {
  ami           = data.aws_ami.al2.id
  instance_type = var.was_ec2_type
  subnet_id     = var.pri_subnet_a_id
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = true
  key_name      = var.ec2_key
  tags = {
    Name = "${var.prefix}-was1"
  } 
}

resource "aws_instance" "was2" {
  ami           = data.aws_ami.al2.id
  instance_type = var.was_ec2_type
  subnet_id     = var.pri_subnet_c_id
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = true
  key_name      = var.ec2_key
  tags = {
    Name = "${var.prefix}-was2"
  } 
}