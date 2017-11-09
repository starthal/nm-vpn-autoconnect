#!/bin/bash

# VPN_NAME here is the name of the desired vpn connection to monitor
# Use "nmcli con" to list connections
# edit this line:
##################
VPN_NAME=0f876a95-8963-4587-94c6-99fea5b5bb9e
# enter desired time between checks here (in seconds)
SLEEP_TIME=10
##################

for (( ; ; )); do

    tested=$(nmcli con show ${VPN_NAME} | grep -c "VPN-STATE:.*5" )

    # 0 - no connection - need to start
    # 1 - working connection, continue.

    case ${tested} in
    "0")
        echo "Not connected - starting"
        nmcli con up uuid ${VPN_NAME}
    ;;

    "1")
        # Debugging
        echo "VPN is active" 
    ;;

    *)
        echo "Unexpected response from nmcli: ${tested}" 
    ;;
    esac

    sleep ${SLEEP_TIME}

done
