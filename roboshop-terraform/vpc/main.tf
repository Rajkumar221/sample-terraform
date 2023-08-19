resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_support = true

  tags = {
    Name = "main"
  }
}

module "subnets" {
  source = "./subnets"
    vpc_id = aws_vpc.main.id
    
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route" gw {
  route_table_id            = module.subnets["public"].cidr_block.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
  
}

resource "aws_eip" "ngw" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.ngw
    subnet_id = lookup(lookup(module.subnets, "public", null), "subnet_ids", null)[0]
  
}

resource "aws_route" ngw {
  count = length(locals.all_route_table_ids)
  route_table_id            = element(locals.all_route_table_ids, count.index)
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.ngw.id
  
}