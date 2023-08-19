resource "aws_subnet" "main" {
  count = length(var.cidr_block)
  vpc_id     = var.vpc_id
  cidr_block = element(var.cidr_block, count.index)
  availability_zone = element(var.az, count.index)
  
  tags = {
    Name = "Main"
  }
}

resource "aws_route_table" "example" {
  vpc_id = var.vpc_id


  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "a" {
  count = length(aws_subnet.main.*.id)
  subnet_id      = element(aws_subnet.main.*.id, count.index)
  route_table_id = aws_route_table.example.id
}