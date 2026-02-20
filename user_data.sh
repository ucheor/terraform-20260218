#!/bin/bash
sudo apt update -y
sudo apt install -y apache2
systemctl start apache2
systemctl enable apache2
echo “Hello World from $(hostname -f)” > /var/www/html/index.html