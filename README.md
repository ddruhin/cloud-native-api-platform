**AWS API Gateway – Enterprise Reference Architecture**

This repository implements Phase 1 of a multi phase, enterprise grade serverless API platform. The long term architecture is designed for:
•	Dual region HA/DR
•	Auto scaling and performance validation
•	Chaos testing and failure injection
•	Multi cloud replication (Azure / GCP)
Phase 1 is fully implemented and live. 
Phases 2 and 3 are in progress / planned and documented here for architectural clarity.


Phase 1 – Core Platform (LIVE)
A production aligned AWS native foundation:
•	HTTP API v2 → Lambda proxy
•	2.9k req/min, 120ms p95, ~99% success (k6 validated)
•	CloudWatch Golden Signals dashboard + 5xx alarms
•	AWS Budgets for cost governance
•	Terraform IaC with S3 + DynamoDB locking
•	Fully reproducible, destroyable, zero drift infrastructure
This phase establishes the baseline platform that future HA/DR and multi cloud capabilities will build on.


Phase 2 – HA/DR & Scaling (IN PROGRESS)
Architectural patterns defined; implementation underway:
•	Dual region deployment (us east 1 + us west 2)
•	Cross region routing and failover patterns
•	Auto scaling validation under load
•	Chaos testing (latency injection, failure simulation)
•	Client ready demo environment


Phase 3 – Multi Cloud Expansion (PLANNED)
Designs completed; implementation scheduled:
•	Azure API Management replication
•	GCP Apigee X replication
•	Multi cloud traffic federation patterns

---

## **📌 Overview**

This POC provisions:

- **Amazon API Gateway (HTTP API)**  
- **AWS Lambda integration (placeholder for backend logic)**  
- **CloudWatch dashboards, metrics, and alarms**  
- **AWS Budgets for cost control**  
- **Terraform remote state (S3 + DynamoDB locking)**  
- **k6 load testing script for latency and error‑rate validation**

It is designed to be:

- Small  
- Understandable  
- Easy to deploy  
- Representative of real production patterns  

---

## **📁 Repository Structure**

```
terraform/aws/
├── providers.tf        # AWS provider + default tags
├── backend.tf          # Terraform remote state (S3 + DynamoDB lock)
├── apigateway.tf       # API Gateway + stage + invoke URL output
├── observability.tf    # CloudWatch dashboard + alarms
├── budgets.tf          # AWS Budgets cost guardrails
└── load-test/k6.js     # k6 load testing script
```

---

## **🏗️ Architecture**

```
Internet
   ↓
[API Gateway HTTP API]
   ↓ (Lambda Proxy Integration)
[Lambda Function Placeholder]
   ↓
[CloudWatch Logs / Metrics / Alarms]
```

This architecture demonstrates:

- Serverless edge routing  
- Automatic scaling  
- Pay‑per‑request economics  
- Basic observability and cost governance  

---

## **🚀 Deployment**

### **Terraform Deploy**

```bash
cd terraform/aws
terraform init
terraform plan -var="environment=dev"
terraform apply -var="environment=dev"
```

### **Load Test**

```bash
cd load-test
k6 run k6.js
```

---

## **🔍 Technical Implementation**

### **API Gateway (apigateway.tf)**

Creates:

- **HTTP API** (`aws_apigatewayv2_api`)  
- **Auto‑deploy stage** (`aws_apigatewayv2_stage`)  
- **Invoke URL output**  

This is the minimal pattern for:

- Edge routing  
- Lambda proxy integration  
- Environment‑specific stages  
- CORS / mapping templates (extendable)  

---

### **Terraform State Backend (backend.tf)**

Uses the standard AWS production pattern:

- **S3 bucket** for remote state  
- **DynamoDB table** for state locking  
- **Encryption enabled**  
- **Versioning supported by S3**  

This prevents:

- Concurrent applies  
- State corruption  
- Local state drift  

---

### **Observability (observability.tf)**

Implements:

#### **CloudWatch Dashboard**
- API Gateway latency (p95)  
- API Gateway request count  
- Lambda duration (p95)  
- Lambda error count  

#### **CloudWatch Alarm**
- High API Gateway 5XX error rate  
- Threshold: >10 errors over 2 minutes  

This provides a **Golden Signals**‑style view of the POC.

---

### **Cost Governance (budgets.tf)**

Creates:

- **Monthly cost budget: $20**  
- **Alert at 50% actual spend**  
- **Email notification**  

This prevents runaway costs during testing.

---

### **Load Testing (load-test/k6.js)**

k6 script validates:

- 95th percentile latency < 200ms  
- Error rate < 1%  
- 50 VUs for 30 seconds  
- Basic functional checks (HTTP 200, response time < 250ms)  

This is a realistic, lightweight performance validation pattern.

---

## **🎯 What This Demonstrates**

- **Infrastructure as Code**  
  Terraform for API Gateway, CloudWatch, Budgets, and state backend

- **Serverless API Foundations**  
  Minimal HTTP API + Lambda integration pattern

- **Observability First**  
  Dashboards, metrics, alarms from day zero

- **Cost Awareness**  
  Budget guardrails to prevent accidental overspend

- **Performance Engineering**  
  k6 load testing for latency and reliability validation

---

## **🛠️ Intentional Limitations**

This is a **focused POC**, not a production platform.

- No Lambda business logic (placeholder only)  
- No CI/CD pipeline  
- No custom domain (ACM + CloudFront)  
- No authentication (IAM/Cognito can be added)  
- Single region, single account  
- No VPC Link or private integrations  

These can be added as next steps.

---

## **🔮 Future Enhancements**

- [ ] Add Lambda backend logic  
- [ ] Add Cognito JWT authorizer  
- [ ] Add custom domain (ACM + CloudFront)  
- [ ] Add GitHub Actions CI/CD  
- [ ] Add VPC Link + private ALB  
- [ ] Add WAF + DDoS protection  
- [ ] Add structured logging + X‑Ray tracing  

---

## **🤝 Ideal Use Cases**

- Learning AWS API Gateway patterns  
- Validating serverless cost models  
- Demonstrating Terraform AWS patterns  
- Running lightweight performance tests  

---

## **📄 License**

MIT License  
Every Terraform file maps directly to real AWS infrastructure.

---

📬 Contact / Hiring
Open to Principal Architect, Cloud‑Native Platform Lead, and API Modernization roles.

- **Email:** druhindhavala@gmail.com
- **LinkedIn:** www.linkedin.com/in/druhin-dhavala
- **GitHub:** https://github.com/ddruhin/cloud-native-api-platform

Cloudwatch Observability

<img width="727" height="335" alt="image" src="https://github.com/user-attachments/assets/af77b23a-c9ea-4f67-b21c-d79578dda183" />

K6 - Load test

<img width="835" height="863" alt="image" src="https://github.com/user-attachments/assets/2e9f0a6c-1c9c-4b2e-ba51-f56070cca9ad" />

API Call - Curl

<img width="841" height="759" alt="image" src="https://github.com/user-attachments/assets/e4887622-1ca3-46ef-b73c-ec4aba6eb9c7" />


Note: This is a sanitized architectural reference. All business logic and client‑specific details have been abstracted to protect proprietary data.

---
*Note: This is a sanitized architectural reference. All business logic and client‑specific details have been abstracted to protect proprietary data.*
