module "nginx" {
  source = ".//module1"

  ami = var.ami
}

module "appache" {
  source = ".//module2"

  ami = var.ami
}