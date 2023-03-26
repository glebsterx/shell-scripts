#!/bin/bash

# stop HA

sudo systemctl stop home-assistant@homeassistant

# Become user 'homeassistant'

sudo su -s /bin/bash homeassistant <<'EOF'

# Activate the virtualenv

source /srv/homeassistant/bin/activate

# Install Home Assistant

/srv/homeassistant/bin/pip install -U homeassistant --log /home/homeassistant/.homeassistant/homeassistant_update_log.txt

#exit

EOF

# Access rights to bluetooth

setcap 'cap_net_raw,cap_net_admin+eip' `readlink -f \`which python3\``

# start HA

sudo systemctl start home-assistant@homeassistant

#exit

