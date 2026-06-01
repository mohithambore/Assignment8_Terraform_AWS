#!/bin/bash

apt update -y

apt install -y git python3 python3-pip curl

curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs

cd /home/ubuntu

git clone https://github.com/mohithambore/Assignment8_Terraform_AWS.git

cd /home/ubuntu/Assignment8_Terraform_AWS/flask-backend

pip3 install -r requirements.txt

nohup python3 app.py > flask.log 2>&1 &

cd /home/ubuntu/Assignment8_Terraform_AWS/express-frontend

npm install

nohup node app.js > express.log 2>&1 &