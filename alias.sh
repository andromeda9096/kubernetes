#!/usr/bin/env bash

# Setup Aliases
alias k='kubectl'
alias ns='kubectl config set-context --current --namespace'
alias kurrent='kubectl config view --minify -o "jsonpath={..namespace}" | xargs -I %s echo "Current Namespace: %s"'
alias nodetop='k get nodes | grep Ready | cut -d" " -f1 | xargs kubectl describe node | grep -E "Name: |cpu |memory "'  
