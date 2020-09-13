#!/bin/bash
yum install httpd -y
echo "Server Subnet: ${compute-server-subnets}" >> /var/www/html/index.html
service httpd start
chkconfig httpd on