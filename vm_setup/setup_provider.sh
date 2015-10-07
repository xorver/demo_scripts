#!/usr/bin/env bash

# utilities
sudo yum -y install psmisc wget nano

# epel
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sudo rpm -ivh epel-release-7-5.noarch.rpm
#sudo yum install -y yum-conf-epel

# onedata
sudo wget http://packages.onedata.org/centos/7x/onedata.repo -O /etc/yum.repos.d/onedata.repo
sudo sed -i 's/enabled = 0/enabled = 1/' /etc/yum.repos.d/onedata.repo


# dependencies
wget http://toolkit.globus.org/ftppub/gt6/installers/repo/globus-toolkit-repo-latest.noarch.rpm
sudo yum -y localinstall globus-toolkit-repo-latest.noarch.rpm
sudo yum install botan-devel gmp-devel make openssl-devel libtool-ltdl-devel gcc gcc-c++ \
    libstdc++-devel protobuf-compiler protobuf-devel git which svn

# routes
echo '130.211.151.116 onedata.org ggr' >> /etc/hosts
echo '23.236.57.56    gp1.c.onedata-dev.internal gp1' >> /etc/hosts
echo '146.148.82.243  gp2.c.onedata-dev.internal gp2' >> /etc/hosts

# config todo extract somewhere else
scp /home/lichon/demo_scripts/onepanel_config/gp1.cfg gp1:~/
scp /home/lichon/demo_scripts/onepanel_config/gp2.cfg gp2:~/