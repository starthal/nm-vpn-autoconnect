#!/bin/bash
set -e

install network-autoconnect.sh /usr/local/bin/network-autoconnect.sh
install network-autoconnect.service /lib/systemd/system/network-autoconnect.service

systemctl daemon-reload
if [[ "$(systemctl is-enabled network-autoconnect)" == "disabled" ]]; then
    systemctl enable network-autoconnect
fi
systemctl start network-autoconnect
