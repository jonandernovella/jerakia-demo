#!/bin/bash -eu

docker run -d -P -v $PWD/policy.d:/etc/jerakia/policy.d:z -v $PWD/data:/var/lib/jerakia/data:z -p 9843:9843 -e USERID=$UID crayfishx/jerakia

