#!/usr/bin/env bash

~/bamboos/release/oneprovider_rpm.sh

./deploy_packages.sh
scp /home/lichon/demo_scripts/onepanel_config/gp1.cfg gp1:~/
scp /home/lichon/demo_scripts/onepanel_config/gp2.cfg gp2:~/

./install_provider.sh gp1
./install_provider.sh gp2