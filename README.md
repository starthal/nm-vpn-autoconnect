# nm-vpn-autoconnect
Simple script (with systemd service) to automatically reconnect a VPN via NetworkManager

Edit `VPNNAME` in `nm-vpn-autoconnect.sh` to correspond to your VPN UUID.

You can see the UUID in the output of `nmcli con`.

Then:

    sudo ./install.sh
