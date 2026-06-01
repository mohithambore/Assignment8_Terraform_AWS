#!/bin/bash

yum update -y

yum install -y python3 git

curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -

yum install -y nodejs

echo "Terraform setup completed" > /home/ec2-user/setup.log
