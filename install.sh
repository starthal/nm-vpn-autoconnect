#!/bin/bash
set -e

install nm-vpn-autoconnect.sh /usr/local/bin/vpn-autoconnect.sh
install nm-vpn-autoconnect.service /lib/systemd/system/
systemctl enable nm-vpn-autoconnect
systemctl start nm-vpn-autoconnect
