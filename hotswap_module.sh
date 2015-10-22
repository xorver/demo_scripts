#!/usr/bin/env bash

set -e

~/op-worker-demo/make.py compile

for host in gp1 gp2
do
    scp ~/op-worker-demo/ebin/${1}.beam ${host}:~/
    ssh -tt ${host} sudo cp ~/${1}.beam '/opt/oneprovider/nodes/worker/lib/oneprovider_node-*/ebin/'
    ssh -tt ${host} sudo cp ~/${1}.beam '/opt/oneprovider/nodes/ccm/lib/oneprovider_node-*/ebin/'

    ssh -tt ${host} sudo /usr/lib64/erlang/lib/erl_interface-*/bin/erl_call -c 'oneprovider_node' -n "worker@${host}.c.onedata-dev.internal" -a "\"code soft_purge [${1}]\""
    ssh -tt ${host} sudo /usr/lib64/erlang/lib/erl_interface-*/bin/erl_call -c 'oneprovider_node' -n "worker@${host}.c.onedata-dev.internal" -a "\"code load_file [${1}]\""

    ssh -tt ${host} sudo /usr/lib64/erlang/lib/erl_interface-*/bin/erl_call -c 'oneprovider_node' -n "ccm@${host}.c.onedata-dev.internal" -a "\"code soft_purge [${1}]\""
    ssh -tt ${host} sudo /usr/lib64/erlang/lib/erl_interface-*/bin/erl_call -c 'oneprovider_node' -n "ccm@${host}.c.onedata-dev.internal" -a "\"code load_file [${1}]\""
done