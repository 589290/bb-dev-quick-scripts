#!/bin/bash

echo
echo '⏳ exporting kubeconfig...'
export KUBECONFIG=~/.kube/username-dev-config
echo '✅ exported.'
echo

echo '⏳ helm deleting releases...'
helm delete bigbang -n bigbang
echo '✅ helm deleted.'
echo

echo '⏳ executing >> ./bigbang/scripts/remove-ns-finalizer.sh'
echo
./bigbang/scripts/remove-ns-finalizer.sh

kubectl delete ns bigbang
kubectl delete ns istio-system

echo
echo '✅ ns finalized.'
echo
