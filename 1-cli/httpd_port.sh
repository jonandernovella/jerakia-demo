#!/bin/bash -eux

jerakia lookup port --namespace httpd --metadata environment:prod

jerakia lookup port --namespace httpd --metadata environment:dev

jerakia lookup port --namespace httpd --metadata environment:prod

