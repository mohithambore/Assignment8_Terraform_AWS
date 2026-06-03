#!/bin/bash

exec > /home/ubuntu/userdata.log 2>&1

apt update -y

curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

apt install -y nodejs git

cd /home/ubuntu

git clone https://github.com/mohithambore/Assignment8_Terraform_AWS.git

cd /home/ubuntu/Assignment8_Terraform_AWS/express-frontend

npm install

nohup node app.js > express.log 2>&1 &