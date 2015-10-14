#!/usr/bin/env bash

ssh -tt $1 fusermount -u ~/fuse
ssh -tt $1 sudo yum remove -y oneclient
ssh -tt $1 sudo killall oneclient
ssh -tt $1 sudo rm -rf ~/.local/share/oneclient/
ssh -tt $1 sudo yum localinstall -y oneclient-2.6.0-1.el7.centos.x86_64.rpm

