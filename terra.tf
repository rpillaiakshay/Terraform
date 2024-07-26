provider "aws" {
  region = "ap-south-1"
}
resource "aws_security_group" "first" {
  name        = "Firstone"
  description = "Ping"
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
resource "aws_security_group" "second" {
  name        = "Secondone"
  description = "ssh"
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
resource "aws_instance" "third" {
  key_name               = "Arp2"
  ami                    = "ami-01376101673c89611"
  vpc_security_group_ids = ["Firstone"]
  instance_type          = "t2.micro"
  tags = {
    Name = "Amazon"
  }
}
resource "aws_instance" "fourth" {
  key_name               = "Arp2"
  ami                    = "ami-0ad21ae1d0696ad58"
  vpc_security_group_ids = ["Secondone"]
  instance_type          = "t2.micro"
  tags = {
    Name = "Ubuntu"
  }
}
resource "aws_s3_bucket" "fifth" {
  bucket = "chekuthan"
  tags = {
    Name = "chekuthan"
  }
}








