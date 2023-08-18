#!/bin/bash

# Update the system
yum update -y

# Install Nginx
yum install -y nginx

# Enable Nginx to start on system boot
systemctl enable nginx

# Start Nginx service
systemctl start nginx