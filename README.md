## Overview
This project provisions a **production-like Azure Kubernetes Service (AKS) environment** hosting a Flask microservice application.  
It includes:

- Infrastructure provisioning via **Terraform**
- Containerized Flask app deployed to **AKS**
- CI/CD automation via **Azure DevOps Pipelines**
- Monitoring with **Prometheus** and **Grafana**
- Security scanning using **Checkov/Terrascan**
- Terraform state stored in **Azure Storage Account**

---

## Folder Structure

aks-flask-prod-env/
├── app/ # Flask app code, Dockerfile, requirements
├── terraform/ # Terraform scripts (AKS, ACR, KeyVault, backend)
├── k8s/ # Kubernetes manifests (Deployment, Service, Ingress)
├── monitoring/ # Prometheus & Grafana Helm values
├── pipelines/ # Azure DevOps pipeline YAML
├── setup.sh # Automated deployment script
└── README.md

yaml
Copy code

---

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- [Docker](https://www.docker.com/get-started)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- Helm (for Prometheus & Grafana)

---

## Setup & Deployment

1. Clone the repo:
```bash
git clone <YOUR_REPO_URL>
cd aks-flask-prod-env
Make setup script executable:

bash
Copy code
chmod +x setup.sh
Run deployment script:

bash
Copy code
./setup.sh
This will:

Initialize and apply Terraform to create AKS, ACR, Key Vault

Build and push Docker image to Azure Container Registry

Deploy Kubernetes manifests to AKS

Set up monitoring namespace app-monitoring (Prometheus & Grafana)

Access
Flask App: Access via AKS LoadBalancer IP or configured Ingress host

Grafana Dashboard:

URL: http://<LoadBalancer-IP> or Ingress host

Username: admin

Password: admin123

Prometheus: Accessible in app-monitoring namespace via port-forward or LoadBalancer

CI/CD Pipeline
Azure DevOps Pipeline located in pipelines/azure-pipelines.yaml

Automates:

Docker image build & push

Kubernetes deployment

Trigger: main branch

Terraform Security Scanning
Check Terraform code for security and compliance:

Using Checkov
bash
Copy code
checkov -d terraform/
Using Terrascan
bash
Copy code
terrascan scan -d terraform/
Scan results should be reviewed before production deployments.

Notes & Assumptions
Namespace for monitoring: app-monitoring

Terraform backend: Azure Storage Account aksflaskprodstorage in container tfstate

CI/CD uses Azure DevOps service connections for AKS and ACR

This setup is production-like, not full production ready (e.g., no HTTPS ingress, limited node pool scaling)
