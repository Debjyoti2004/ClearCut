#!/bin/bash

# ------------------------------------------------------------------------------
# Helm Installer Script 
# Author: Debjyoti Shit
# Description: Installs the latest stable version of Helm on Ubuntu/Debian.
# ------------------------------------------------------------------------------

set -euo pipefail

HELM_SCRIPT_URL="https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3"
HELM_SCRIPT="get_helm.sh"

echo "[INFO] Updating system package index..."
sudo apt-get update -y > /dev/null

echo "[INFO] Checking if 'curl' is installed..."
if ! command -v curl >/dev/null 2>&1; then
  echo "[INFO] 'curl' not found. Installing curl..."
  sudo apt-get install -y curl
fi

echo "[INFO] Downloading official Helm install script from Helm GitHub..."
if curl -fsSL -o "$HELM_SCRIPT" "$HELM_SCRIPT_URL"; then
  echo "[SUCCESS] Helm install script downloaded."
else
  echo "[ERROR] Failed to download Helm install script from $HELM_SCRIPT_URL"
  exit 1
fi

echo "[INFO] Making script executable..."
chmod +x "$HELM_SCRIPT"

echo "[INFO] Executing Helm install script..."
./"$HELM_SCRIPT"

echo "[INFO] Cleaning up temporary script..."
rm -f "$HELM_SCRIPT"

echo "[INFO] Verifying Helm installation..."
if command -v helm >/dev/null 2>&1; then
  echo "[SUCCESS] Helm installed successfully! Version: $(helm version --short)"
else
  echo "[ERROR] Helm installation failed."
  exit 1
fi
