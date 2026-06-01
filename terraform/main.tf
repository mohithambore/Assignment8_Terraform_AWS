provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "app_sg" {
  name        = "flask-express-sg"
  description = "Allow SSH, Flask and Express"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
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

resource "aws_instance" "app_server" {

  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  user_data = file("userdata.sh")

  tags = {
    Name = "Terraform-Flask-Express"
  }
}
