resource "aws_instance" "example" {
  ami           = "ami-06b09bfacae1453cb"
  instance_type = "t2.micro"

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > /tmp/greeting.txt
  EOF

  tags = {
    Name = "example"
  }
}
s