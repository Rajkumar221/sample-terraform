resource "aws_security_group" "sg" {
  name        = "${var.component}-sg"
  description = "Allow TLS inbound traffic"

  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.component}-sg"
  }
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]

  user_data = templatefile("module3/userdata.sh", {
      env = var.env
      component = var.component
    })


  tags = {
    Name = "HelloWorld"
  }
}
