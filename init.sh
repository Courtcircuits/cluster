#!/bin/bash

# set up sealed secrets
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm install sealed-secrets -n kube-system --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets

echo "Hi 👋, you are setting up your cluster..."

# kubectl create namespace services

echo "Input a Cloudflare API Key 🔑 (setting up external dns) : "
read cloudflare_key

b64_cloudflare_key="$(echo "$cloudflare_key" | base64)"

echo "
apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-api-key
  namespace: services
data:
  apiToken: $b64_cloudflare_key
" | kubeseal --controller-namespace kube-system --controller-name sealed-secrets-controller --format yaml >./services/templates/cloudflare-secret.yaml
