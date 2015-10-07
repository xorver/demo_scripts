#!/usr/bin/env bash


ssh -tt gp1 sudo rm -rf /home/oneprovider*.rpm
ssh -tt gp2 sudo rm -rf /home/oneprovider*.rpm

scp /home/lichon/bamboos/release/build/oneprovider-*x86_64.rpm gp1:~/
scp /home/lichon/bamboos/release/build/oneprovider-*x86_64.rpm gp2:~/
