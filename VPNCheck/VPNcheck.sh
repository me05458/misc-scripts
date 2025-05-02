#!/bin/bash
result=$( curl https://am.i.mullvad.net/connected -s)
trueresult="${result:0:17}"
echo "$trueresult"
checker="0"
notify-send "VPNChecker" "\n   Activated\n"
while [ TRUE ]
do
if [ "$trueresult" != "You are connected" ]
then
    if [ "$checker" == "0" ]
    then
        notify-send "VPNChecker" "\nVPN is offline!!!\n"
    fi
    checker="1"

else
    checker="0"
fi
done
