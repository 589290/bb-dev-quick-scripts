#!/bin/bash

echo
echo '⏳ exporting kubeconfig...'
export KUBECONFIG=~/.kube/username-dev-config
echo '✅ exported.'
echo

echo '⏳ registry1 docker login...'
set +o history
export REGISTRY1_USERNAME=user
export REGISTRY1_PASSWORD=pass
echo $REGISTRY1_PASSWORD | docker login registry1.dso.mil --username $REGISTRY1_USERNAME --password-stdin
set -o history
echo '✅ logged in.'
echo

echo '⏳ flux install...'
echo
./bigbang/scripts/install_flux.sh -u $REGISTRY1_USERNAME -p $REGISTRY1_PASSWORD

# NOTE: After running this command the terminal may appear to be stuck on
# "networkpolicy.networking.k8s.io/allow-webhooks created"
# It's not stuck, the end of the .sh script has a kubectl wait command, give it 5 min
# Also if you have slow internet/hardware you might see a false error message
# error: timed out waiting for the condition on deployments/helm-controller

echo
echo '✅ flux complete.'
echo

# as long as the following command shows STATUS "Running" you are good to go...
echo '⏳ flux namespace pods...'
echo
kubectl get pods --namespace=flux-system
echo
echo '✅'
echo