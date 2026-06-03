provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "frontend_sg" {
  name = "frontend-sg"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

resource "aws_security_group" "backend_sg" {
  name = "backend-sg"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

resource "aws_instance" "backend" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"

  key_name = "terraform-key"

  user_data = file("backend-userdata.sh")

  vpc_security_group_ids = [
    aws_security_group.backend_sg.id
  ]

  tags = {
    Name = "Flask-Backend"
  }
}

resource "aws_instance" "frontend" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"

  key_name = "terraform-key"

  user_data = file("frontend-userdata.sh")

  vpc_security_group_ids = [
    aws_security_group.frontend_sg.id
  ]

  tags = {
    Name = "Express-Frontend"
  }
}