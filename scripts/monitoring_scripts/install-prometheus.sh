#!/bin/bash
# -----------------------------------------------------------------------------
# Prometheus installation script for Kubernetes
# Maintained by: Debjyoti Shit
# Description: Installs Prometheus in a Kubernetes cluster using Helm.
# -----------------------------------------------------------------------------

set -e

kubectl create namespace monitoring 2>/dev/null || echo "[INFO] Namespace 'monitoring' already exists."

echo "[INFO] Adding Prometheus Helm repo..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "[INFO] Installing Prometheus using Helm..."
helm install prometheus prometheus-community/prometheus \
  --namespace monitoring \
  --set server.service.type=NodePort \
  --set alertmanager.enabled=false \
  --set pushgateway.enabled=false

echo "[SUCCESS] Prometheus installation complete!"
