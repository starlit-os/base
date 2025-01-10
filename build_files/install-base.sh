#!/usr/bin/env bash

set -ouex pipefail

# Install ublue-os stuff
dnf install -y install \
    /tmp/rpms/config/ublue-os-{signing,luks,udev*,update*}.noarch.rpm \
    /tmp/rpms/akmods/*.rpm

dnf config-manager setopt fedora-multimedia.enabled=1
dnf config-manager setopt fedora-multimedia.priority=90

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

# Docker install: https://docs.docker.com/engine/install/centos/#install-using-the-repository
dnf config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Incus
dnf copr enable -y ganto/lxc4
dnf -y install \
    edk2-ovmf \
    genisoimage \
    incus \
    incus-agent \
    incus-client \
    qemu-char-spice \
    qemu-device-display-virtio-vga \
    qemu-device-display-virtio-gpu \
    qemu-device-usb-redirect \
    qemu-img \
    qemu-kvm-core \
    swtpm

# Tailscale
dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf config-manager setopt tailscale-stable.enabled=0
dnf -y --enablerepo tailscale-stable install \
    tailscale
