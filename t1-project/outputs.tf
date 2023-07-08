output "public_ip_test" {
    value = aws_instance.test[*].public_ip
}

# output "public_ip_test" {
#   value = [for instance in aws_instance.test : instance.public_ip]
# }
