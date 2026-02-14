**AWS API Gateway – Enterprise Reference Architecture**

This repository implements Phase 1 of a multi-phase, enterprise-grade serverless API platform on AWS.

Long-term architecture designed for:

- Dual-region HA/DR
- Auto-scaling and performance validation
- Chaos testing and failure injection
- Multi-cloud replication (Azure API Management / GCP Apigee X)


**Phase 1 – Core Platform (LIVE)**
Production-aligned AWS-native foundation demonstrating real serverless API patterns, observability, cost governance, and performance behavior.

**Delivered in Phase 1**
- HTTP API v2 → Lambda proxy integration
- Live /api/orders endpoint (Lambda placeholder backend)
- Load-tested: ~2.9k requests/min using k6 (50 virtual users)
- Performance: ~120ms p95 latency, ~99% success rate
- Terraform IaC with:
   - Remote state in S3
   - DynamoDB state locking
   - Fully reproducible, destroyable, zero-drift infrastructure


**Observability (LIVE)**

```
CloudWatch Golden Signals Dashboard:
├── Latency (p95)
├── Traffic
├── Errors
└── Lambda duration
```


```
CloudWatch Alarms: 
└── 5xx error-rate alarm (API Gateway)
```

```
CloudWatch Alarms: 
└── 5xx error-rate alarm (API Gateway)
```


**Cost Governance (LIVE)**
```AWS Budgets:
├── $20/month budget 
└── 50% threshold alerts
```
This establishes the baseline platform for future HA/DR and multi-cloud expansion.



**Phase 2 – HA/DR & Scaling (IN PROGRESS)**
Architectural patterns defined; implementation underway.

Planned capabilities:
- Dual-region deployment (us-east-1 + us-west-2)
- Cross-region routing and failover patterns
- Auto-scaling validation (sustained + burst load)
- Chaos testing:
   - Latency injection
   - Failure simulation
   - Region-level disruption scenarios
- Client-ready demo environment


**Phase 3 – Multi-Cloud Expansion (PLANNED)**
Designs completed; implementation scheduled.

Planned capabilities:
- Azure API Management replication
- GCP Apigee X replication
- Multi-cloud traffic federation patterns

**Repository Structure**
```
terraform/aws/
├── providers.tf        # AWS provider + default tags
├── backend.tf          # Terraform remote state (S3 + DynamoDB lock)
├── apigateway.tf       # API Gateway HTTP API + stage + invoke URL
├── observability.tf    # CloudWatch dashboard + metric alarms
├── budgets.tf          # AWS Budgets cost guardrails
└── load-test/
    └── k6.js           # k6 load testing script
```

**Architecture (Phase 1)**
Internet
  ↓
[API Gateway HTTP API]
  ↓ (Lambda Proxy)
[Lambda Function] 
  ↓
[CloudWatch Logs/Metrics/Alarms]
  ↓
[Golden Signals Dashboard + 5xx Alarm]

[Terraform State: S3 + DynamoDB Lock]
[AWS Budgets: $20/mo + 50% Alerts]


**🚀 Deployment**
Terraform:

bash
cd terraform/aws
terraform init
terraform plan -var="environment=dev" 
terraform apply -var="environment=dev"


**Load Test:**

bash
cd load-test
k6 run k6.js


**Technical Highlights**
| Component     | File             | Key Features                                 |
| ------------- | ---------------- | -------------------------------------------- |
| API Gateway   | apigateway.tf    | HTTP API v2, auto-deploy stage, Lambda proxy |
| Observability | observability.tf | Golden Signals dashboard, 5xx alarms         |
| Cost Control  | budgets.tf       | $20/mo budget, 50% alerts                    |
| State Mgmt    | backend.tf       | S3 remote state + DynamoDB locking           |
| Load Testing  | k6.js            | 2.9k req/min, 120ms p95 validated            |


**Scope & Limitations (Intentional)**
Phase 1 Focus:
```
✅ AWS-native only
✅ Single-region baseline
❌ No Kubernetes/Kong
❌ No multi-cloud (Phases 2-3)
```
This keeps Phase 1: Simple. Reproducible. Production-aligned.


**Roadmap Summary**
- Phase 1 (LIVE): Core AWS platform
- Phase 2 (IN PROGRESS): Dual-region HA/DR + chaos
- Phase 3 (PLANNED): Azure + GCP replication


**Ideal Usage**
- Architecture deep dives
- Client demonstrations
- Platform engineering discussions
- Phase 1 blueprint for enterprise API initiatives


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
