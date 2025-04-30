#!/bin/bash
result=$( curl https://am.i.mullvad.net/connected -s)
checker="0"
while [ TRUE ]
do
if [ "$result" != "You are connected to Mullvad (server se-sto-ovpn-001). Your IP address is 185.65.135.133" ]
then
    if [ "$checker" == "0" ]
    then
        notify-send "Hi" "Test"
    fi
    checker="1"

else
    checker="0"
fi
done
