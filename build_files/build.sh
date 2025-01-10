#!/usr/bin/env bash

set -ouex pipefail

/tmp/pre-install.sh
/tmp/install-base.sh
/tmp/fixes.sh
/tmp/services.sh
