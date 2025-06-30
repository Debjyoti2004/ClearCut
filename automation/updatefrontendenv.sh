#!/bin/bash

# -----------------------------------------------------------------------------
# Update the frontend environment variables.
# Maintained by: Debjyoti Shit
# Description: Update the frontend environment variables in the .env file.
# -----------------------------------------------------------------------------

set -euo pipefail

# ---------- Configuration ----------
INSTANCE_ID="i-0fd6386b421fdd1fe"
ENV_FILE_PATH="../frontend/.env"
AWS_REGION="us-east-1" 
PORT="32000"
KEY="VITE_BACKEND_URL"

# ---------- Fetch EC2 Public IP ----------
echo "📡 Fetching EC2 public IP for instance: $INSTANCE_ID"
IP_ADDRESS=$(aws ec2 describe-instances \
  --instance-ids "$INSTANCE_ID" \
  --region "$AWS_REGION" \
  --query 'Reservations[0].Instances[0].PublicIpAddress' \
  --output text)

if [[ -z "$IP_ADDRESS" || "$IP_ADDRESS" == "None" ]]; then
  echo "❌ Could not fetch public IP. Exiting."
  exit 1
fi

# ---------- New Backend URL ----------
NEW_URL="http://${IP_ADDRESS}:${PORT}"
echo "✅ New backend URL will be: $NEW_URL"

# ---------- Check & Update .env ----------
if [[ ! -f "$ENV_FILE_PATH" ]]; then
  echo "❌ .env file not found at $ENV_FILE_PATH"
  exit 1
fi

echo "🔍 Checking current value in .env..."
CURRENT_LINE=$(grep -E "^$KEY[[:space:]]*=" "$ENV_FILE_PATH" || true)

if [[ "$CURRENT_LINE" == "$KEY=\"$NEW_URL\"" ]]; then
  echo "✅ No update needed. URL already set to $NEW_URL"
else
  echo "🛠️ Updating $KEY in $ENV_FILE_PATH..."
  sed -i.bak -E "s|^$KEY[[:space:]]*=.*|$KEY=\"$NEW_URL\"|" "$ENV_FILE_PATH"
  echo "✅ .env updated. Verifying..."

  # ---------- Re-verify Update ----------
  UPDATED_LINE=$(grep -E "^$KEY[[:space:]]*=" "$ENV_FILE_PATH" | tr -d ' ')
  EXPECTED_LINE="${KEY}=\"${NEW_URL}\""

  if [[ "$UPDATED_LINE" == "$EXPECTED_LINE" ]]; then
    echo "🎉 Verified: $KEY is correctly set to $NEW_URL"
  else
    echo "❌ Verification failed. $KEY was not updated properly in $ENV_FILE_PATH"
    echo "🔎 Found: $UPDATED_LINE"
    echo "🧾 Expected: $EXPECTED_LINE"
    exit 1
  fi
fi
