#plain variable (string)
variable "course" {
    default = "devops"
}

output "batch" {
    value = var.course
}

#number
variable "course" {
    default = 100
}

output "batch" {
  value = var.batch
}

#if we want to print two variables together 
output "sample" {
  value = "${var.course}-${var.count}"
}
#bool

