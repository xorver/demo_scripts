#!/usr/bin/env bash

ssh -tt $1 sudo killall beam
ssh -tt $1 sudo killall oneclient
ssh -tt $1 sudo yum remove -y oneprovider
ssh -tt $1 sudo yum remove -y oneclient
ssh -tt $1 sudo rm -rf /opt/globalregistry /opt/bigcouch /mnt/vfs/*

ssh -tt $1 sudo yum -y localinstall oneprovider*.rpm
ssh -tt $1 sleep 5
ssh -tt $1 sudo onepanel_admin --install /home/lichon/*.cfg
