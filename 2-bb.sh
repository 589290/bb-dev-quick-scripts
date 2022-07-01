#!/bin/bash

echo
echo '⏳ exporting kubeconfig...'
export KUBECONFIG=~/.kube/username-dev-config
echo '✅ exported.'

echo 
echo '⏳ deploying BB...'
echo

helm upgrade \
  --install bigbang ./bigbang/chart \
  --create-namespace \
  --namespace bigbang \
  --values ./overrides/ib_creds.yaml \
  --values ./overrides/vault.yaml \
  --values ./bigbang/chart/ingress-certs.yaml


#  --values ./overrides/gitlab-values.yaml \

#  use in tandem w/ gatekeeper
#  --values ./bigbang/docs/example_configs/policy-overrides-k3d.yaml \

#  --set registryCredentials[0].username="${REGISTRY1_USERNAME}" \
#  --set registryCredentials[0].password="${REGISTRY1_PASSWORD}" \
#  --set registryCredentials[0].registry=registry1.dso.mil \

echo
echo '✅ bb deployed.'
echo

# helm list -n=bigbang
# kubectl get vs -A
# kubectl get virtualservices --all-namespaces

