resource "aws_instance" "test" {
  ami = "ami-06b09bfacae1453cb"
 instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}