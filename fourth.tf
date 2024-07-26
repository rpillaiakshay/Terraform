provider "aws" {
  region = "ap-south-1"
}
resource "aws_security_group" "first" {
  name = "First"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  description = "SSH"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "second" {
  tags = {
    Name = "First"
  }
  ami                   = "ami-01376101673c89611"
  vpc_security_group_ids = ["First"]
  key_name = "Arp2"
  instance_type         = "t2.micro"
}


