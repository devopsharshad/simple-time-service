# SimpleTimeService – DevOps Assessment

## Overview

This project is created as part of the Particle41 DevOps Team Challenge.  
It consists of:

1. A minimalist Python-based web application (`SimpleTimeService`)
2. A Docker container to package and run the app
3. Infrastructure code written in Terraform to deploy it on AWS ECS using Fargate

---

## Project Structure

```
.
├── app/                # Python app and Dockerfile
│   ├── main.py
│   └── Dockerfile
├── terraform/          # Terraform code for deploying on AWS
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
└── README.md           # This file
```

---

## Features

- The service returns JSON like:

```json
{
  "timestamp": "2025-07-12 17:00:00",
  "ip": "203.0.113.10"
}
```

- Runs on port `5000`
- Container is built with a **non-root user**
- Deploys to **ECS Fargate** in a **private subnet**, accessed via **ALB in public subnet**

---

## Prerequisites

- **Docker** installed → [Install Docker](https://docs.docker.com/get-docker/)
- **Terraform** v1.0+ → [Install Terraform](https://developer.hashicorp.com/terraform/downloads)
- **AWS CLI** configured → [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

Configure AWS CLI:

```bash
aws configure
```

Provide your AWS Access Key, Secret, Region (`ap-south-1`), and default format.

---

## Part 1 – Build & Run the Container

### 🔧 Build the Docker image

```bash
cd app
docker build -t simple-time-service .
```

### ▶️ Run the container locally

```bash
docker run -p 5000:5000 simple-time-service
```

Access: http://localhost:5000

---

## Part 2 – Deploy to AWS with Terraform

### 📁 Navigate to terraform folder

```bash
cd terraform
```

### 📦 Initialize Terraform

```bash
terraform init
```

### 👁️ Review the plan

```bash
terraform plan
```

### 🚀 Apply to deploy

```bash
terraform apply
```

Wait for it to finish and note the `load_balancer_url` output.

---

## Output

Visit the ALB URL in a browser or use:

```bash
curl http://<your-alb-dns>
```

You should receive JSON with current timestamp and your IP.

---

## Cleanup

To avoid ongoing charges:

```bash
terraform destroy
```

---

## Notes

- App runs as non-root inside Docker (see `Dockerfile`)
- ECS tasks run in **private** subnets
- ALB is placed in **public** subnets
- Security groups allow HTTP (port 80) on ALB and port 5000 on ECS

---