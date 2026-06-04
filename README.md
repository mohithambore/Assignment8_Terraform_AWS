# Assignment 8 - Terraform AWS ECS Deployment

## Objective

Deploy a Flask backend and Express frontend as Docker containers using AWS services and Terraform.

## Architecture

- AWS ECR for container image storage
- AWS ECS Fargate for container orchestration
- AWS VPC with public subnets
- Application Load Balancer (ALB)
- Security Groups
- Terraform Infrastructure as Code

## Project Structure

.
├── flask-backend/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── express-frontend/
│   ├── server.js
│   ├── package.json
│   └── Dockerfile
│
└── terraform-part3/
    ├── provider.tf
    ├── vpc.tf
    ├── ecr.tf
    ├── ecs.tf
    ├── alb.tf
    ├── security_groups.tf
    ├── outputs.tf
    └── variables.tf

## AWS Services Used

- Amazon ECR
- Amazon ECS (Fargate)
- Application Load Balancer
- VPC
- IAM
- Security Groups

## Deployment Steps

### 1. Create ECR Repositories

```bash
terraform apply
```

### 2. Build Docker Images

Backend:

```bash
docker build -t flask-backend .
```

Frontend:

```bash
docker build -t express-frontend .
```

### 3. Push Images to ECR

Authenticate:

```bash
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.ap-south-1.amazonaws.com
```

Tag Images:

```bash
docker tag flask-backend:latest <ECR_BACKEND_URL>:latest
docker tag express-frontend:latest <ECR_FRONTEND_URL>:latest
```

Push Images:

```bash
docker push <ECR_BACKEND_URL>:latest
docker push <ECR_FRONTEND_URL>:latest
```

### 4. Deploy ECS Services

```bash
terraform apply
```

## Verification

Check ECS Services:

```bash
aws ecs list-services \
--cluster assignment8-cluster \
--region ap-south-1
```

Check Running Tasks:

```bash
aws ecs list-tasks \
--cluster assignment8-cluster \
--region ap-south-1
```
Webhook test for Jenkins CI/CD pipeline.

## Outputs

Example:

```text
alb_dns_name = assignment8-alb-xxxxxxxx.ap-south-1.elb.amazonaws.com
ecs_cluster_name = assignment8-cluster
```

## Result

Successfully deployed:

- Flask Backend on ECS Fargate
- Express Frontend on ECS Fargate
- Images stored in ECR
- Traffic routed through ALB
- Infrastructure managed using Terraform

## Author

Mohith A S
