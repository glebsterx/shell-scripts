#!/bin/bash
get_latest_release() {
  curl --silent "https://api.github.com/repos/AlexxIT/go2rtc/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
get_curent_version() {
  curl --silent "http://127.0.0.1:1984/api" | # Get curent version from go2rtc api
    grep '"version":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}


#latest="v1.1.2"
latest=$(get_latest_release)
url="https://github.com/AlexxIT/go2rtc/releases/download/${latest}/go2rtc_linux_amd64"
curent=$(get_curent_version)
latest="${latest:1}"
if [ "$latest" == "$curent" ]; then
  echo "You have actual release"
  echo $curent
else
  echo "Curent Version:${curent}"
  echo "getting update New Version:${latest}"
  sudo systemctl stop go2rtc
  sudo rm go2rtc_linux_amd64
  sudo wget $url
  sudo chmod +x go2rtc_linux_amd64
  sudo systemctl start go2rtc
fi
