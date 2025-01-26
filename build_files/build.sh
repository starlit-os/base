#!/usr/bin/env bash

set -ouex pipefail

/tmp/pre-install.sh
/tmp/install-base.sh
/tmp/services.sh

# Fix incorrect placement of policy.json
mv /usr/etc/containers/policy.json /etc/containers/policy.json
rm -r /usr/etc
