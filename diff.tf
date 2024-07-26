provider "aws" {
  region = "ap-south-1"
}
resource "aws_security_group" "first" {
  name        = "first"
  description = "added ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "second" {
  name        = "second"
  description = "added ssh and http"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "firstone" {
  ami               = "ami-0ad21ae1d0696ad58"
  availability_zone = "ap-south-1a"
  instance_type     = "t2.micro"
  tags = {
    Name = "Ubuntu"
  }
}
resource "aws_instance" "secondone" {
  ami               = "ami-01376101673c89611"
  availability_zone = "ap-south-1b"
  instance_type     = "t2.micro"
  tags = {
    Name = "amazon"
  }
}
