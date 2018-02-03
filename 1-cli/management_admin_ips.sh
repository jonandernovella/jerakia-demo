#!/bin/bash -eux

jerakia lookup admin_ips --namespace management --metadata environment:prod certname:yoghurt_carpet

jerakia lookup admin_ips --namespace management --metadata environment:prod certname:monoton_fisk

jerakia lookup admin_ips --namespace management --metadata environment:prod certname:yoghurt_carpet --type cascade

jerakia lookup admin_ips --namespace management --metadata environment:prod certname:monoton_fisk --type cascade

