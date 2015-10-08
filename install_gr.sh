#!/usr/bin/env bash

ssh -tt ggr sudo killall beam
ssh -tt ggr sudo yum remove -y globalregistry
ssh -tt ggr sudo rm -rf /opt/globalregistry /opt/bigcouch
ssh -tt ggr sudo yum -y localinstall globalregistry*.rpm
ssh -tt ggr sleep 5
ssh -tt ggr sudo onepanel_admin --install /home/lichon/ggr.cfg
