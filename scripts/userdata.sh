#!/bin/bash
echo "Este es un mensaje" > ~/mensaje.txt
yum udpate -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd
