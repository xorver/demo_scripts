#!/usr/bin/env bash

ssh -tt $1 fusermount -u ~/fuse
ssh -tt $1 sudo yum remove -y oneclient
ssh -tt $1 sudo killall oneclient
ssh -tt $1 sudo rm -rf ~/.local/share/oneclient/
ssh -tt $1 sudo yum install -y oneclient

ssh -tt $1 mkdir ~/fuse
ssh -tt $1 PROVIDER_HOSTNAME=$1 oneclient --authentication token ~/fuse

