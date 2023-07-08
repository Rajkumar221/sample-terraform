variable "component" {
    default = "nginx"
}

default "ami" { }

default "instance_type" {
    default = "t2.micro"
}

variable "env" {
    default = "dev"
}

