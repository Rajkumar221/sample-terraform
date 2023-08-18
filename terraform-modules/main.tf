# module "nginx" {
#   source = ".//module1"

#   ami = var.ami
# }

# module "appache" {
#   source = ".//module2"

#   ami = var.ami
# }

module "nginx" {
  source = ".//module3"

  ami = var.ami
  instance_type = var.instance_type
}