#!/usr/bin/env bash

set -ouex pipefail

# Install ublue-os stuff
dnf install -y install \
    /tmp/rpms/config/ublue-os-{signing,luks,udev-rules}.noarch.rpm

# Install base packages
dnf install -y \
    audit \
    clevis-dracut \
    clevis-pin-tpm2 \
    firewalld \
    git-core \
    hwdata \
    ipcalc \
    libva \
    libva-intel-media-driver \
    libvirt \
    mesa-dri-drivers \
    mesa-va-drivers \
    rsync \
    ssh-key-dir \
    wireguard-tools

# Tailscale
dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf config-manager setopt tailscale-stable.enabled=0
dnf -y --enablerepo tailscale-stable install \
    tailscale
