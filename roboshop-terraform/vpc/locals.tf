locals {
  all_route_table_ids = [
    module.subnets.route_table_ids["app"],
    module.subnets.route_table_ids["web"],
    module.subnets.route_table_ids["db"],
    module.subnets.route_table_ids["public"]
  ]
}