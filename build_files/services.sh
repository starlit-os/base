#!/usr/bin/env bash

set -ouex pipefail

# Enable services
systemctl enable podman.socket
systemctl enable rpm-ostreed-automatic.timer
systemctl enable tailscaled.service
