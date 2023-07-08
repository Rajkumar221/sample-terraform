# resource "aws_instance" "test" {
#  count = length(var.component)
#  ami = "ami-03265a0778a880afb"
#  instance_type = var.instance_type

#   tags = {
#     Name = "${var.component[count.index]}-${var.env}"
#   }
# }

resource "aws_instance" "test" {
  for_each = toset(var.component)

  ami           = "ami-03265a0778a880afb"
  instance_type = var.instance_type

  tags = {
    Name = "${each.value}-${var.env}"
  }
}
