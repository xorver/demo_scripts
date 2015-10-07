#!/usr/bin/env bash

ssh -tt sudo killall beam
ssh -tt sudo yum remove -y globalregistry
ssh -tt sudo rm -rf /opt/globalregistry /opt/bigcouch
ssh -tt sudo yum -y localinstall globalregistry*.rpm
ssh -tt sleep 5
ssh -tt sudo onepanel_admin --install /home/lichon/ggr.cfg
