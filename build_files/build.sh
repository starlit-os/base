#!/usr/bin/env bash

set -ouex pipefail

/tmp/pre-install.sh
/tmp/install-base.sh
/tmp/services.sh
