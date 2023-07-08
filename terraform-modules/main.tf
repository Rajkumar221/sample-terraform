module "nginx" {
  source = ".//module1"
}

module "appache" {
  source = ".//module2"
}