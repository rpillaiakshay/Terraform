provider "aws" {
  region = "ap-south-1"
}
resource "aws_security_group" "firstt_sg" {
  name        = "firstonee"
  description = "added ping and SSH"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8
    to_port     = 8
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "firstt_inst" {
  count                  = 2
  ami                    = "ami-01376101673c89611"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  vpc_security_group_ids = ["firstonee"]
  tags = {
    Name = "firstt"
  }
}

