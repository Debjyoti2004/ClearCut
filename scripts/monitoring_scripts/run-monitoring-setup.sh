#!/bin/bash

# -----------------------------------------------------------------------------
# Full monitoring stack setup script for Kubernetes
# Maintained by: Debjyoti Shit
# Description: This script sets up a full monitoring stack including Helm, Prometheus, and Grafana in a Kubernetes cluster.
# -----------------------------------------------------------------------------

set -e

echo "Starting full monitoring stack setup..."

echo "Granting execute permission to scripts..."
chmod +x install-helm.sh install-prometheus.sh install-grafana.sh expose-monitoring-services.sh get-grafana-password.sh

echo "Installing Helm..."
./install-helm.sh

echo "Installing Prometheus..."
./install-prometheus.sh

echo "Installing Grafana..."
./install-grafana.sh

echo "Waiting 60s for monitoring pods to initialize..."
sleep 60

echo "Exposing Prometheus and Grafana services..."
./expose-monitoring-services.sh

echo "Fetching Grafana admin password..."
./get-grafana-password.sh

echo "Monitoring stack setup complete!"
