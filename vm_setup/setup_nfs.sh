#!/usr/bin/env bash


yum install nfs-utils nfs-utils-lib
chkconfig nfs on
service rpcbind start
service nfs start

mkdir /nfs
echo '/nfs/ *(rw,async,no_root_squash,no_subtree_check)' > /etc/exports
exportfs -a

mkdir /mnt/vfs
mount -t nfs 127.0.0.1:/nfs /mnt/vfs