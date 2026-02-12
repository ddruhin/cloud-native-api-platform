<img width="86" height="17" alt="image" src="https://github.com/user-attachments/assets/2818612a-3cbc-4809-9bd6-5a79942bb784" />


Enterprise Cloud‑Native API Platform (2026 PoC)
Architectural Lead & Platform Strategy

🎯 Executive Summary
A production‑grade, cloud‑managed, serverless, and Terraform‑driven API platform built on AWS API Gateway + Lambda, designed as a repeatable blueprint for cloud‑native modernization.

This PoC demonstrates:

how to build a real API platform using AWS‑native services
how to validate performance, scalability, observability, and cost governance
how to run a production‑style workload with Golden Signals, alarms, and load testing
how to structure IaC for multi‑cloud portability (Azure APIM, GCP Apigee X next)
This is the cloud‑managed half of a multi‑cloud API strategy, with Kubernetes‑native gateways (Kong/Tyk) positioned as optional hybrid extensions.

🏗️ Architecture Overview
Core Platform (AWS‑Managed)
API Gateway v2 (HTTP API)
AWS Lambda (Python) backend
Terraform IaC (clean state, 0 drift)
CloudWatch Observability (Golden Signals dashboard)
CloudWatch Alarms (error‑rate SLO)
Serverless auto‑scaling
$0.01/day cost profile

Business API
/api/orders → JSON response
Designed for extension into /api/customers, /api/payments, etc.

Performance Engineering
k6 load test: 50 VUs, 1450 iterations, ~2.9k req/min
p95 latency: 120ms under load
99% success rate

Security (Experimented & Cleaned)
Cognito OAuth2/OIDC
JWT Authorizer
Cleanly removed to keep POC minimal and cost‑efficient


🚀 Key Outcomes
1. Live Production‑Style API
Code
GET https://<api-id>.execute-api.us-east-1.amazonaws.com/api/orders
Returns JSON payload with business logic.

2. Load‑Tested Capacity
50 VUs
1450 iterations
2.9k req/min
p95 < 200ms
Zero errors

3. Observability (Golden Signals)
Latency (p50/p95/p99)
Request count
Error rate
Lambda duration
Alarm: >5% error rate

4. Governance & IaC
Terraform modules
Remote state
Zero drift
Full destroy → zero orphans

5. Economics
$0.01/day
Free tier: 1M API Gateway + 1M Lambda
Serverless auto‑scaling

📂 Repository Structure
Code
terraform-poc/
├── k6.js                     # Load test script
├── Load-test-results.txt     # 1450 iteration proof
├── README.md                 # This document
└── terraform/
    └── aws/
        ├── main.tf           # API Gateway + Lambda IaC
        ├── outputs.tf        # Live URLs
        └── observability.tf  # CloudWatch dashboards + alarms

🔍 Validation Artifacts
Load Testing
Script: k6.js

Results: Load-test-results.txt

Screenshots included

Observability
CloudWatch Golden Signals dashboard
Error‑rate alarm
Lambda logs + metrics
Governance
Terraform plan = 0 changes
Clean destroy
No console drift

🔄 Modernization Patterns Demonstrated
Legacy → Serverless API Gateway
Monolith → Function‑based backend
Centralized → Terraform‑driven governance
On‑prem → Cloud‑native
High‑cost → $0.01/day serverless economics

🌐 Multi‑Cloud Roadmap (Next Steps)
This AWS POC is the anchor for a 3‑cloud architecture.

Azure (Next)
Azure API Management
Azure Functions backend
Azure Monitor observability
Terraform IaC
GCP (Next)
Apigee X

Cloud Run backend
Cloud Logging/Monitoring
Terraform IaC
Hybrid (Optional)
Kong Gateway on EKS/AKS/GKE
Internal API mesh
mTLS + JWT + rate limiting

🛠 Technical Competency Mapping 
Cloud Providers
AWS (API Gateway, Lambda, CloudWatch)
Azure (APIM) — planned
GCP (Apigee X) — planned

IaC & Automation
Terraform modules
Remote state
Zero drift
GitHub Actions (optional extension)

API Strategy
Serverless APIs
Cloud‑managed gateways
Modernization patterns
Multi‑cloud portability

Reliability & Observability
CloudWatch dashboards
Golden Signals
k6 load testing
Error‑rate alarms

Security
OAuth2/OIDC (Cognito)
JWT authorizers
IAM roles
KMS encryption

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
