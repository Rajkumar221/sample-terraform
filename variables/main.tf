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

#list
variable "courses" {
  default = [
    "devops",
    "aws",
    "python"
  ]
}

# we can write the above code like below also
# variable "courses" {
#     default = ["devops", "aws", "python"]
# }

output "courses" {
  value = var.courses
}

# map
variable "course_details" {
    default = {
        devops = {
            name = "devops"
            time = "6AM"
            duration = "60min"
        }
        aws = {
            name = "aws"
            time = "7am"
            duration = "60min"
        }
    }
}