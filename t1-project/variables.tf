variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "instance_type_is_t2.micro"
}

variable "tags" {
  default = "HellowWorld"
}

variable "instance_count" {
    default = 2
}