#!/usr/bin/env bash

ssh -tt $1 sudo yum remove -y oneprovider
ssh -tt $1 sudo killall beam
ssh -tt $1 sudo killall onepanel
ssh -tt $1 sudo killall epmd
ssh -tt $1 sudo killall oneproxy
ssh -tt $1 sudo rm -rf /opt/oneprovider /opt/bigcouch /mnt/vfs/* /mnt/vfs_proxy/*

ssh -tt $1 sudo yum -y localinstall oneprovider*.rpm
ssh -tt $1 sleep 5
ssh -tt $1 sudo onepanel_admin --install /home/lichon/*.cfg
