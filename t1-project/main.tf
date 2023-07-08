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

resource "aws_instance" "test" {
 count = length(var.component)
 ami = "ami-03265a0778a880afb"
 instance_type = var.instance_type
 vpc_security_group_ids = [aws_security_group.allow_all.id]
  
  tags = {
    Name = "${var.component[count.index]}-${var.env}"
  }
}

# resource "aws_instance" "test" {
#   for_each = toset(var.component)

#   ami           = "ami-03265a0778a880afb"
#   instance_type = var.instance_type

#   tags = {
#     Name = "${each.value}-${var.env}"
#   }
# }
