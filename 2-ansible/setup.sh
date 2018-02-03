#!/bin/bash -eu

mkdir -p /etc/ansible/facts.d
cp -f facts.d/* /etc/ansible/facts.d

echo "Generate a token using 'jerakia token create <name>' and insert it in jerakia.yaml"
