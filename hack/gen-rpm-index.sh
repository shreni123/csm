#!/usr/bin/env bash

# Copyright 2021 Hewlett Packard Enterprise Development LP

set -ex

# The repo options to rpm-index are generated from the CSM/csm-rpms repo as
# follows:
#
#   $ find repos -name '*.repos' | xargs cat | sed -e 's/#.*$//' -e '/[[:space:]]/!d' | awk '{ print "-d", $1, $(NF) }' | column -t
#
# Note that the kubernetes/el7/x86_64 repo is included as it is implicitly
# added by the ncn-k8s image.

docker run --rm -i arti.dev.cray.com/internal-docker-stable-local/packaging-tools:0.11.0 rpm-index -v \
-d  https://arti.dev.cray.com/artifactory/csm-rpm-stable-local/hpe/                                                         cray/csm/sle-15sp3/x86_64 \
-d  https://arti.dev.cray.com/artifactory/csm-rpm-stable-local/release/                                                     cray/csm/sle-15sp3/x86_64 \
-d  https://arti.dev.cray.com/artifactory/mirror-HPE-SPP/SUSE_LINUX/SLES15-SP3/x86_64/current/                  hpe/SUSE_LINUX/SLES15-SP3/x86_64/current \
-d  https://arti.dev.cray.com/artifactory/mirror-HPE-SPP/SUSE_LINUX/SLES15-SP2/x86_64/current/                  hpe/SUSE_LINUX/SLES15-SP2/x86_64/current \
-d  https://artifactory.algol60.net/artifactory/csm-rpms/hpe/stable/sle-15sp2/                                              cray/csm/sle-15sp3 \
-d  https://artifactory.algol60.net/artifactory/csm-rpms/hpe/stable/sle-15sp3/                                              cray/csm/sle-15sp3 \
-d  https://arti.dev.cray.com/artifactory/cos-rpm-stable-local/release/cos-2.1/sle15_sp2_ncn/                               cray/cos-2.1/sle15_sp2_ncn \
-d  https://arti.dev.cray.com/artifactory/cos-rpm-stable-local/release/cos-2.2/sle15_sp3_ncn/                               cray/cos-2.2/sle15_sp3_ncn \
-d  https://arti.dev.cray.com/artifactory/cos-rpm-stable-local/release/cos-2.2/sle15_sp3_cn/                                cray/cos-2.2/sle15_sp3_cn \
-d  https://arti.dev.cray.com/artifactory/slingshot-host-software-rpm-stable-local/release/cos-2.2/sle15_sp2_ncn/           cray/cos-2.2/sle15_sp2_ncn \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Basesystem/15-SP2/x86_64/product/                  suse/SLE-Module-Basesystem/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Basesystem/15-SP2/x86_64/product_debug/            suse/SLE-Module-Basesystem/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Basesystem/15-SP2/x86_64/update/                    suse/SLE-Module-Basesystem/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Basesystem/15-SP2/x86_64/update_debug/              suse/SLE-Module-Basesystem/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Containers/15-SP2/x86_64/product/                  suse/SLE-Module-Containers/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Containers/15-SP2/x86_64/product_debug/            suse/SLE-Module-Containers/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Containers/15-SP2/x86_64/update/                    suse/SLE-Module-Containers/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Containers/15-SP2/x86_64/update_debug/              suse/SLE-Module-Containers/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Desktop-Applications/15-SP2/x86_64/product/        suse/SLE-Module-Desktop-Applications/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Desktop-Applications/15-SP2/x86_64/product_debug/  suse/SLE-Module-Desktop-Applications/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Desktop-Applications/15-SP2/x86_64/update/          suse/SLE-Module-Desktop-Applications/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Desktop-Applications/15-SP2/x86_64/update_debug/    suse/SLE-Module-Desktop-Applications/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Development-Tools/15-SP2/x86_64/product/           suse/SLE-Module-Development-Tools/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Development-Tools/15-SP2/x86_64/product_debug/     suse/SLE-Module-Development-Tools/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Development-Tools/15-SP2/x86_64/update/             suse/SLE-Module-Development-Tools/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Development-Tools/15-SP2/x86_64/update_debug/       suse/SLE-Module-Development-Tools/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-HPC/15-SP2/x86_64/product/                         suse/SLE-Module-HPC/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-HPC/15-SP2/x86_64/product_debug/                   suse/SLE-Module-HPC/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-HPC/15-SP2/x86_64/update/                           suse/SLE-Module-HPC/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-HPC/15-SP2/x86_64/update_debug/                     suse/SLE-Module-HPC/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Legacy/15-SP2/x86_64/product/                      suse/SLE-Module-Legacy/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Legacy/15-SP2/x86_64/product_debug/                suse/SLE-Module-Legacy/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Legacy/15-SP2/x86_64/update/                        suse/SLE-Module-Legacy/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Legacy/15-SP2/x86_64/update_debug/                  suse/SLE-Module-Legacy/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Public-Cloud/15-SP2/x86_64/product/                suse/SLE-Module-Public-Cloud/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Public-Cloud/15-SP2/x86_64/product_debug/          suse/SLE-Module-Public-Cloud/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Public-Cloud/15-SP2/x86_64/update/                  suse/SLE-Module-Public-Cloud/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Public-Cloud/15-SP2/x86_64/update_debug/            suse/SLE-Module-Public-Cloud/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Python2/15-SP2/x86_64/product/                     suse/SLE-Module-Python2/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Python2/15-SP2/x86_64/product_debug/               suse/SLE-Module-Python2/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Python2/15-SP2/x86_64/update/                       suse/SLE-Module-Python2/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Python2/15-SP2/x86_64/update_debug/                 suse/SLE-Module-Python2/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Server-Applications/15-SP2/x86_64/product/         suse/SLE-Module-Server-Applications/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Server-Applications/15-SP2/x86_64/product_debug/   suse/SLE-Module-Server-Applications/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Server-Applications/15-SP2/x86_64/update/           suse/SLE-Module-Server-Applications/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Server-Applications/15-SP2/x86_64/update_debug/     suse/SLE-Module-Server-Applications/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Web-Scripting/15-SP2/x86_64/product/               suse/SLE-Module-Web-Scripting/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Web-Scripting/15-SP2/x86_64/product_debug/         suse/SLE-Module-Web-Scripting/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Web-Scripting/15-SP2/x86_64/update/                 suse/SLE-Module-Web-Scripting/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Web-Scripting/15-SP2/x86_64/update_debug/           suse/SLE-Module-Web-Scripting/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-HPC/15-SP2/x86_64/product/                        suse/SLE-Product-HPC/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-HPC/15-SP2/x86_64/product_debug/                  suse/SLE-Product-HPC/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-HPC/15-SP2/x86_64/update/                          suse/SLE-Product-HPC/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-HPC/15-SP2/x86_64/update_debug/                    suse/SLE-Product-HPC/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-SLES/15-SP2/x86_64/product/                       suse/SLE-Product-SLES/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-SLES/15-SP2/x86_64/product_debug/                 suse/SLE-Product-SLES/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-SLES/15-SP2/x86_64/update/                         suse/SLE-Product-SLES/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-SLES/15-SP2/x86_64/update_debug/                   suse/SLE-Product-SLES/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-WE/15-SP2/x86_64/product/                         suse/SLE-Product-WE/15-SP2/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-WE/15-SP2/x86_64/product_debug/                   suse/SLE-Product-WE/15-SP2/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-WE/15-SP2/x86_64/update/                           suse/SLE-Product-WE/15-SP2/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-WE/15-SP2/x86_64/update_debug/                     suse/SLE-Product-WE/15-SP2/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Backports/SLE-15-SP2_x86_64/standard/                                  suse/Backports-SLE/15-SP2/x86_64/standard \
    -d  http://slemaster.us.cray.com/SUSE/Backports/SLE-15-SP2_x86_64/standard_debug/                            suse/Backports-SLE/15-SP2/x86_64/standard_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Basesystem/15-SP3/x86_64/product/                  suse/SLE-Module-Basesystem/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Basesystem/15-SP3/x86_64/product_debug/            suse/SLE-Module-Basesystem/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Containers/15-SP3/x86_64/product/                  suse/SLE-Module-Containers/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Containers/15-SP3/x86_64/product_debug/            suse/SLE-Module-Containers/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Basesystem/15-SP3/x86_64/update/                    suse/SLE-Module-Basesystem/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Containers/15-SP3/x86_64/update/                    suse/SLE-Module-Containers/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Containers/15-SP3/x86_64/update_debug/              suse/SLE-Module-Containers/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Desktop-Applications/15-SP3/x86_64/product/        suse/SLE-Module-Desktop-Applications/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Desktop-Applications/15-SP3/x86_64/product_debug/  suse/SLE-Module-Desktop-Applications/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Desktop-Applications/15-SP3/x86_64/update/          suse/SLE-Module-Desktop-Applications/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Desktop-Applications/15-SP3/x86_64/update_debug/    suse/SLE-Module-Desktop-Applications/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Development-Tools/15-SP3/x86_64/product/           suse/SLE-Module-Development-Tools/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Development-Tools/15-SP3/x86_64/product_debug/     suse/SLE-Module-Development-Tools/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Development-Tools/15-SP3/x86_64/update/             suse/SLE-Module-Development-Tools/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Development-Tools/15-SP3/x86_64/update_debug/       suse/SLE-Module-Development-Tools/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-HPC/15-SP3/x86_64/product/                         suse/SLE-Module-HPC/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-HPC/15-SP3/x86_64/product_debug/                   suse/SLE-Module-HPC/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-HPC/15-SP3/x86_64/update/                           suse/SLE-Module-HPC/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-HPC/15-SP3/x86_64/update_debug/                     suse/SLE-Module-HPC/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Legacy/15-SP3/x86_64/product/                      suse/SLE-Module-Legacy/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Legacy/15-SP3/x86_64/product_debug/                suse/SLE-Module-Legacy/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Legacy/15-SP3/x86_64/update/                        suse/SLE-Module-Legacy/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Legacy/15-SP3/x86_64/update_debug/                  suse/SLE-Module-Legacy/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Public-Cloud/15-SP3/x86_64/product/                suse/SLE-Module-Public-Cloud/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Public-Cloud/15-SP3/x86_64/product_debug/          suse/SLE-Module-Public-Cloud/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Public-Cloud/15-SP3/x86_64/update/                  suse/SLE-Module-Public-Cloud/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Public-Cloud/15-SP3/x86_64/update_debug/            suse/SLE-Module-Public-Cloud/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Python2/15-SP3/x86_64/product/                     suse/SLE-Module-Python2/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Python2/15-SP3/x86_64/product_debug/               suse/SLE-Module-Python2/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Python2/15-SP3/x86_64/update/                       suse/SLE-Module-Python2/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Python2/15-SP3/x86_64/update_debug/                 suse/SLE-Module-Python2/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Server-Applications/15-SP3/x86_64/product/         suse/SLE-Module-Server-Applications/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Server-Applications/15-SP3/x86_64/product_debug/   suse/SLE-Module-Server-Applications/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Server-Applications/15-SP3/x86_64/update/           suse/SLE-Module-Server-Applications/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Server-Applications/15-SP3/x86_64/update_debug/     suse/SLE-Module-Server-Applications/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Web-Scripting/15-SP3/x86_64/product/               suse/SLE-Module-Web-Scripting/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Module-Web-Scripting/15-SP3/x86_64/product_debug/         suse/SLE-Module-Web-Scripting/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Web-Scripting/15-SP3/x86_64/update/                 suse/SLE-Module-Web-Scripting/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Module-Web-Scripting/15-SP3/x86_64/update_debug/           suse/SLE-Module-Web-Scripting/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-HPC/15-SP3/x86_64/product/                        suse/SLE-Product-HPC/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-HPC/15-SP3/x86_64/product_debug/                  suse/SLE-Product-HPC/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-HPC/15-SP3/x86_64/update/                          suse/SLE-Product-HPC/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-HPC/15-SP3/x86_64/update_debug/                    suse/SLE-Product-HPC/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-SLES/15-SP3/x86_64/product/                       suse/SLE-Product-SLES/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-SLES/15-SP3/x86_64/product_debug/                 suse/SLE-Product-SLES/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-SLES/15-SP3/x86_64/update/                         suse/SLE-Product-SLES/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-SLES/15-SP3/x86_64/update_debug/                   suse/SLE-Product-SLES/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-WE/15-SP3/x86_64/product/                         suse/SLE-Product-WE/15-SP3/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/SLE-Product-WE/15-SP3/x86_64/product_debug/                   suse/SLE-Product-WE/15-SP3/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-WE/15-SP3/x86_64/update/                           suse/SLE-Product-WE/15-SP3/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/SLE-Product-WE/15-SP3/x86_64/update_debug/                     suse/SLE-Product-WE/15-SP3/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/Storage/7/x86_64/product/                                     suse/Storage/7/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/Storage/7/x86_64/product_debug/                               suse/Storage/7/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/Storage/7/x86_64/update/                                       suse/Storage/7/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/Storage/7/x86_64/update_debug/                                 suse/Storage/7/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Products/Storage/6/x86_64/product/                                     suse/Storage/6/x86_64/product \
    -d  http://slemaster.us.cray.com/SUSE/Products/Storage/6/x86_64/product_debug/                               suse/Storage/6/x86_64/product_debug \
    -d  http://slemaster.us.cray.com/SUSE/Updates/Storage/6/x86_64/update/                                       suse/Storage/6/x86_64/update \
    -d  http://slemaster.us.cray.com/SUSE/Updates/Storage/6/x86_64/update_debug/                                 suse/Storage/6/x86_64/update_debug \
    -d  http://slemaster.us.cray.com/SUSE/Backports/SLE-15-SP3_x86_64/standard/                                  suse/Backports-SLE/15-SP3/x86_64/standard \
    -d  http://slemaster.us.cray.com/SUSE/Backports/SLE-15-SP3_x86_64/standard_debug/                            suse/Backports-SLE/15-SP3/x86_64/standard_debug \
    -d  https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64                                        kubernetes/el7/x86_64 \
    -d  https://artifactory.algol60.net/artifactory/sles-mirror/Updates/Storage/7/x86_64/update/                 suse/Storage/7/x86_64/update \
    -d  https://artifactory.algol60.net/artifactory/hpe-mirror-mlnx_ofed_cx4plus/SLES15-SP3/x86_64/5.4-1.0.3.0/      hpe/mlnx_ofed_cx4plus/ \
    -d  https://artifactory.algol60.net/artifactory/hpe-mirror-hexane/15/x86_64/current/                          hpe/hexane/ \
    -d  https://artifactory.algol60.net/artifactory/sles-mirror/Updates/SLE-Product-SLES/15-SP2-LTSS/x86_64/update  cray/csm/sle-15sp2 \
    -d  https://artifactory.algol60.net/artifactory/sles-mirror/Updates/SLE-Product-SLES/15-SP2-LTSS/x86_64/update_debug  cray/csm/sle-15sp2 \
    -
