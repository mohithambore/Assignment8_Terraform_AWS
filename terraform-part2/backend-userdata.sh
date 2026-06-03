#!/bin/bash

exec > /home/ubuntu/userdata.log 2>&1

apt update -y
apt install -y python3-pip python3-venv git

cd /home/ubuntu

git clone https://github.com/mohithambore/Assignment8_Terraform_AWS.git

cd /home/ubuntu/Assignment8_Terraform_AWS/flask-backend

python3 -m venv venv

source venv/bin/activate

pip install --upgrade pip

pip install -r requirements.txt

nohup python app.py > flask.log 2>&1 &