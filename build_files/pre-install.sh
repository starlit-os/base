#!/usr/bin/env bash

set -ouex pipefail

#### PREPARE
# See https://github.com/centos-workstation/achillobator/issues/3
mkdir -m 0700 -p /var/roothome

dnf install -y 'dnf5-plugins'

# always disable cisco-openh264 repo
dnf config-manager setopt fedora-cisco-openh264.enabled=0
