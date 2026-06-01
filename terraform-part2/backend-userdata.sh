#!/bin/bash

apt update -y
apt install python3-pip git -y

cd /home/ubuntu

git clone https://github.com/mohithambore/Assignment8_Terraform_AWS.git

cd Assignment8_Terraform_AWS/flask-backend

pip3 install -r requirements.txt

nohup python3 app.py > flask.log 2>&1 &