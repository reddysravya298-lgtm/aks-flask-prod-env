#!/bin/bash
# setup.sh - Deploy AKS Flask app with Terraform and Kubernetes

# Step 1: Terraform init & apply
cd terraform
terraform init
terraform apply -auto-approve
cd ..

# Step 2: Build Docker image
az acr login --name aksflaskprodenvacr
docker build -t aksflaskprodenvacr.azurecr.io/aks-flask-prod-env-app:latest ./app
docker push aksflaskprodenvacr.azurecr.io/aks-flask-prod-env-app:latest

# Step 3: Deploy to AKS
az aks get-credentials --resource-group aks-flask-prod-env-rg --name aks-flask-prod-env-cluster
kubectl apply -f k8s/

echo "Deployment completed!"
