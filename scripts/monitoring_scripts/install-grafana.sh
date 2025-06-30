#!/bin/bash
# -----------------------------------------------------------------------------
# Grafana installation script for Kubernetes            
# Maintained by: Debjyoti Shit
# Description: This script installs Grafana in a Kubernetes cluster using Helm.
# -----------------------------------------------------------------------------

set -e

kubectl create namespace monitoring 2>/dev/null || echo "[INFO] Namespace 'monitoring' already exists."

echo "Adding Grafana Helm repo..."
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

echo "Installing Grafana..."
helm install grafana grafana/grafana \
  --namespace monitoring \
  --set adminPassword='admin123' \
  --set service.type=NodePort \
  --set persistence.enabled=true \
  --set persistence.size=1Gi \
  --set persistence.storageClassName="manual"