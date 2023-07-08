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
      sudo apt-get update
      sudo dnf install httpd
      sudo firewall-cmd --permanent --add-service=https
      sudo firewall-cmd --reload
      sudo systemctl start httpd
      sudo systemctl status httpd
      EOF


    tags = {
        Name = "${var.component}-${var.env}" 
    }

}