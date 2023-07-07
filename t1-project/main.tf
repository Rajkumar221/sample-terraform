resource "aws_instance" "test" {
 count = var.instance_count
 ami = "ami-06b09bfacae1453cb"
 instance_type = var.instance_type

  tags = {
    Name = var.tags
  }
}

