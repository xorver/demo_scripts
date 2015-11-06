#!/usr/bin/env bash


ssh -tt gp1 sudo rm -rf /home/oneprovider*.rpm
ssh -tt gp2 sudo rm -rf /home/oneprovider*.rpm

scp ~/bamboos/release/build/oneprovider-*el7.centos.x86_64.rpm gp1:~/
scp ~/bamboos/release/build/oneprovider-*el7.centos.x86_64.rpm gp2:~/
