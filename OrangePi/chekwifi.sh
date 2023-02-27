#!/bin/bash
get_status() {
nmcli |grep "^wlan0: disconnected"|awk -F ':' '{print $1}'
}
status=$(get_status)
if [ -z $status ]; then
	echo "Wifi Connected"
else
	echo "Wifi Disconnected"
	sudo systemctl restart NetworkManager
fi
