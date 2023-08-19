locals {
  all_route_table_ids = [
    module.subnets.app_route_table_ids,
    module.subnets.web_route_table_ids,
    module.subnets.db_route_table_ids,
    module.subnets.public_route_table_ids,
  ]
}