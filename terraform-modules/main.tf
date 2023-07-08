module "nginx" {
  source = "./module1"
  for_each = var.nginx
  ami = each.value["ami"]
}

module "appache" {
  source = "./module2"
  for_each = var.appache
  ami = each.value["ami"]
}