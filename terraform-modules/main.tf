module "module1" {
  source = "./module1"
  for_each = var.module1
  ami = each.value["ami"]
}

module "module2" {
  source = "./module2"
}