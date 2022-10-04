#!/bin/bash
set -o errexit
set -o pipefail

envs=("dev" "nonprod" "prod")
for env in ${envs[@]}; do
  echo "Working in $env"
  terraform -chdir=$env init
  terraform -chdir=$env apply --auto-approve
done