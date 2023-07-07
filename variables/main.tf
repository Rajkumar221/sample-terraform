#plain variable (string)
variable "course" {
    default = "devops"
}

output "course" {
    value = var.course
}

#number
variable "batch" {
    default = 100
}

output "batch" {
  value = var.batch
}

#if we want to print two variables together 
output "sample" {
  value = "${var.course}-${var.batch}"
}


#bool

