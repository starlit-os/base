#!/usr/bin/env bash

set -ouex pipefail

# Set fixed group IDs
groupmod -g 250 incus-admin
groupmod -g 251 incus
groupmod -g 252 docker
