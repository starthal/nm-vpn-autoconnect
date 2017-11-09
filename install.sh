#!/bin/bash
set -e

install nm-vpn-autoconnect.sh /usr/local/bin/nm-vpn-autoconnect.sh
install nm-vpn-autoconnect.service /lib/systemd/system/nm-vpn-autoconnect.service

systemctl daemon-reload
if [[ "$(systemctl is-enabled nm-vpn-autoconnect)" == "disabled" ]]; then
    systemctl enable nm-vpn-autoconnect
fi
systemctl start nm-vpn-autoconnect
