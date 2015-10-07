#!/usr/bin/env bash

~/bamboos/release/oneprovider_rpm.sh
deploy_packages.sh
install_provider.sh gp1
install_provider.sh gp2