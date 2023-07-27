#!/bin/bash

sudo yum install wget unzip httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo wget https://www.tooplate.com/zip-templates/2134_gotto_job.zip
sudo unzip -o 2134_gotto_job.zip
sudo cp -r 2134_gotto_job/* /var/www/html/
sudo systemctl restart httpd
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user