provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0ec0e125bb6c6e8ec" // Replaced with our own desired AMI
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.example.id]
  key_name               = "terraform"
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Allow inbound traffic on port 22"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
