variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "instance_type_is_t2.micro"
}

variable "tags" {
  default = ["user1", "user2"]
}

variable "instance_count" {
    default = 2
}