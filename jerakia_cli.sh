#!/bin/bash -eu

docker run --rm -it -v $PWD/policy.d:/etc/jerakia/policy.d:z -v $PWD/data:/var/lib/jerakia/data:z -e USERID=$UID --entrypoint jerakia crayfishx/jerakia "$@"

