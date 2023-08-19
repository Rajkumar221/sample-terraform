variable "cidr_block" {
  default = {
    web = { cidr_block = ["10.0.1.0/24", "10.0.2.0/24"] }
    app = { cidrblock = ["10.0.3.0/24", "10.0.4.0/24"] }
    db = { cidr_block = ["10.0.5.0/24", "10.0.6.0/24"] }
    public = { cidr_block = ["10.0.7.0/24", "10.0.8.0/24"] }
  }
}

variable "az" {
  default = [ "us-east-1a", "us-east-1b" ]
}

variable "vpc_id" {}