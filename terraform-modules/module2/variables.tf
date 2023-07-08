variable "component" {
    default = "appache"
}

default "ami" { }

default "instance_type" {
    default = "t2.micro"
}

variable "env" {
    default = "dev"
}

