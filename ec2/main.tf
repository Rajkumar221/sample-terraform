resource "aws_instance" "test" {
  ami = "ami-06b09bfacae1453cb"
 instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

output "instance_public_ip" {
  value = aws_instance.test.public_ip
}