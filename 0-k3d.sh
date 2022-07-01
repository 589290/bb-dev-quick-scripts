#!/bin/bash

# Usage:
# -b   use big M5 instance. Default is t3.2xlarge
# -p   use private IP for security group and k3d cluster
# -m   create k3d cluster with metalLB
# -d   destroy related AWS resources
# -h   output help

echo
echo '⏳ executing >> ./bigbang/docs/developer/scripts/k3d-dev.sh'
echo
./bigbang/docs/developer/scripts/k3d-dev.sh $1
echo
echo '✅ k3d!'
echo