#!/bin/bash

# CONNECTION here is the name of the desired vpn connection to monitor
# Use "nmcli con" to list connections
# edit this line:
##################
CONNECTION=ffb6a700-0b78-40c5-ba4d-43ae16f2e45f
# enter desired time between checks here (in seconds)
SLEEP_TIME=10
##################

for (( ; ; )); do

    tested=$(nmcli con show ${CONNECTION} | grep -c "GENERAL\.STATE.*activated" )

    # 0 - no connection - need to start
    # 1 - working connection, continue.

    case ${tested} in
    "0")
        echo "Not connected - starting"
        nmcli con up uuid ${CONNECTION}
    ;;

    "1")
        # Debugging
        echo "Network is active" 
    ;;

    *)
        echo "Unexpected response from nmcli: ${tested}" 
    ;;
    esac

    sleep ${SLEEP_TIME}

done
