resource "aws_security_group" "sg" {
  name        = "${var.component}-sg"
  description = "Allow TLS inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
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

resource "aws_instance" "nginx" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.sg.id]

    user_data = <<-EOF
      #!/bin/sh
      sudo yum install nginx
      sudo systemctl enable nginx
      sudo systemctl start nginx
      EOF

    tags = {
        Name = "${var.component}-${var.env}" 
    }
}
