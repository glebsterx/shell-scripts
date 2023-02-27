#!/bin/bash
get_version() {
/srv/homeassistant/bin/python -m pip list|grep '^homeassistant '|awk -F ' ' '{print $2}'
}

get_latest() {
/srv/homeassistant/bin/python -m pip list --outdated |grep '^homeassistant '|awk -F ' ' '{print $3}'
}
latest=$(get_latest)
version=$(get_version)
echo "Curent Version:" $version
echo "Avaliable Version:" $latest

if [ -z $latest ]; then
  echo "You have latest version:" $version
else 
  echo "New version avaliable:" $latest
  echo "Installing ...."
  sudo ./HAupgrade.sh
fi 
