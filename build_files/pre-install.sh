#!/usr/bin/env bash

set -ouex pipefail

#### PREPARE
# See https://github.com/centos-workstation/achillobator/issues/3
mkdir -m 0700 -p /var/roothome

dnf install -y 'dnf5-plugins'

# always disable cisco-openh264 repo
dnf config-manager setopt fedora-cisco-openh264.enabled=0

# use negativo17 for 3rd party packages with higher priority than default
dnf config-manager addrepo --from-repofile=https://negativo17.org/repos/fedora-multimedia.repo
dnf config-manager setopt fedora-multimedia.enabled=1 fedora-multimedia.priority=90
