#plain variable (string)
variable "course" {
    default = "devops"
}

output "course" {
    value = var.course
}

#number
variable "count" {
    default = 100
}

output "count" {
  value = var.count
}

#if we want to print two variables together 
output "sample" {
  value = "${var.course}-${var.count}"
}
#bool

