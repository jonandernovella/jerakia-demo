#!/bin/bash -eu

lookup() {
  local namespace=$1
  local key=$2
  local value=$(jerakia lookup $key \
    --namespace $namespace \
    --metadata environment:${ENVIRONMENT:-prod} certname:${CERTNAME:-midtstilt_kobra})
  echo $key=$value
}

jinja2 packer.json.j2 \
  -D $(lookup aws aws_access_key) \
  -D $(lookup aws aws_secret_key) \
  -D $(lookup aws region) \
  -D $(lookup aws image) \
  -D $(lookup aws instance_type)

