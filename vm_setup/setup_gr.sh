#!/usr/bin/env bash

# utilities
ssh ggr sudo yum -y install psmisc wget

# epel
#ssh ggr wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
#ssh ggr sudo rpm -ivh epel-release-7-5.noarch.rpm
yum install -y yum-conf-epel

# onedata
ssh ggr sudo wget http://packages.onedata.org/centos/7x/onedata.repo -O /etc/yum.repos.d/onedata.repo
ssh ggr sudo sed -i 's/enabled = 0/enabled = 1/' /etc/yum.repos.d/onedata.repo

# dependencies
wget http://toolkit.globus.org/ftppub/gt6/installers/repo/globus-toolkit-repo-latest.noarch.rpm
yum -y localinstall globus-toolkit-repo-latest.noarch.rpm

# routes
echo '130.211.151.116 onedata.org ggr' >> /etc/hosts
echo '23.236.57.56    gp1.c.onedata-dev.internal gp1' >> /etc/hosts
echo '146.148.82.243  gp2.c.onedata-dev.internal gp2' >> /etc/hosts