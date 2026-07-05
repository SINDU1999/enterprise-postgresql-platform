# Enterprise Employee Portal on AWS

## Project Overview

This project demonstrates the deployment of a secure enterprise web application on AWS using Terraform as Infrastructure as Code (IaC).

The application is built using Flask and PostgreSQL and follows a production-style architecture with private networking, secure secret management, and load balancing.

---

## Architecture

Internet
        │
        ▼
Application Load Balancer
        │
        ▼
Private EC2 (Flask Application)
        │
        ├──────────────► AWS Secrets Manager
        │
        ▼
Amazon RDS PostgreSQL

---

## AWS Services Used

- Amazon VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- IAM
- EC2
- Amazon RDS PostgreSQL
- Secrets Manager
- Systems Manager (Session Manager)
- Application Load Balancer

---

## Technologies

- Terraform
- Python
- Flask
- PostgreSQL
- Git
- GitHub

---

## Features

- Infrastructure as Code
- Secure VPC Architecture
- Private EC2 Deployment
- Database Credentials stored in AWS Secrets Manager
- Amazon RDS PostgreSQL
- Application Load Balancer
- Employee Management Portal

---

## Future Improvements

- Docker
- Amazon ECR
- ECS Fargate
- GitHub Actions CI/CD
- CloudWatch Monitoring
- HTTPS using ACM
- Auto Scaling
