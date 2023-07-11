resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > /tmp/greeting.txt
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
  EOF


  tags = {
    Name = "example"
  }

  # provisioner "remote-exec" {

  #   connection {
  #     type     = "ssh"
  #     user     = "centos"
  #     password = "DevOps321"
  #     host     = self.public_ip
  #   }

  #   inline = [
  #     "sudo yum update -y",
  #     "sudo yum install -y httpd",
  #     "sudo systemctl start httpd",
  #     "sudo systemctl enable httpd"
  #   ]
  # }

}
