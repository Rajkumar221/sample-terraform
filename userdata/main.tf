resource "aws_instance" "example" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > /tmp/greeting.txt
  EOF

  tags = {
    Name = "example"
  }
}
