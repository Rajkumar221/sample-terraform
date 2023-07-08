output "public_ip_test" {
    count = var.instance_count
    value = aws_instance.test[count.index].public_ip
}