resource "aws_instance" "test" {
 count = var.instance_count
 ami = "ami-03265a0778a880afb"
 instance_type = var.instance_type

  tags = {
    Name = var.tags[count.index]
  }
}

