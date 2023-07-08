output "public_ip_test" {
    value = aws_instance.test[count.index].public_ip
}