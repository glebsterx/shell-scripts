#!/bin/bash
# logging
exec > /data/HomeAssistant/homeassistant_update_log.txt 2>&1
# stop HA
systemctl stop home-assistant@homeassistant
# Become user 'homeassistant'
su -s /bin/bash homeassistant << 'EOF'
# Activate the virtualenv
source /srv/homeassistant/bin/activate
# Install Home Assistant
/srv/homeassistant/bin/pip install -U homeassistant --log /data/HomeAssistant/homeassistant_update_log.txt
exit
EOF
# to grant access to bluetooth
setcap 'cap_net_raw,cap_net_admin+eip' `readlink -f \`which python3\``
# start HA
systemctl start home-assistant@homeassistant
