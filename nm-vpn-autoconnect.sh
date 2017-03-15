#!/bin/bash

# VPNNAME here is the name of desired vpn connection to monitor
# Use "nmcli con" to list connections
# edit this line:
##################
VPNNAME=75071141-0f00-416c-a163-bbd2e91ec2ad
# enter desired time between checks here (in seconds)
SLEEPTIME=15
##################

nice=0

for (( ; ; )); do

# creating infinite loop

tested=$(nmcli con show $VPNNAME | grep -c "VPN-STATE:.*5" )

#possible results:
# 0 - no connection - need to start
# 1 - working connection, continue.

case $tested in
"0")
echo "Not connected - starting"

#increase nice counter
nice=$[nice+1]

#if "nice start" fails for 3 times
if [ $nice -ge 3 ];
then
#TRY to knock hard way, resetting the network-manager (sometimes it happens in my kubuntu 12.04).
      echo "HARD RESTART"
      nmcli nm enable false
      nmcli nm enable true
      sleep 10
      nmcli con up uuid $VPNNAME
      nice=0
else
#not yet 3 falures - try starting normal way
      echo "trying to enable."
      nmcli con up uuid $VPNNAME
fi

;;

"1")
echo "VPN seems to work" 

;;
esac

sleep $SLEEPTIME

done
