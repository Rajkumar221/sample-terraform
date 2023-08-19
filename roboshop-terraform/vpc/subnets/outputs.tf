output "subnet_ids" {
  value = aws_subnet.main.*.id
}


output "app_route_table_ids" {
  value = module.subnets.app.route_table_ids
}

output "web_route_table_ids" {
  value = module.subnets.web.route_table_ids
}

output "db_route_table_ids" {
  value = module.subnets.db.route_table_ids
}

output "public_route_table_ids" {
  value = module.subnets.public.route_table_ids
}



