#!/bin/bash

# stop HA

sudo systemctl stop esphome@homeassistant

# Become user 'homeassistant'

sudo su -s /bin/bash homeassistant <<'EOF'

# Activate the virtualenv

source /srv/esphome/bin/activate

# Install Home Assistant

/srv/esphome/bin/pip install -U esphome --log /home/homeassistant/.homeassistant/esphome_update_log.txt

#exit

EOF

# start HA

sudo systemctl start esphome@homeassistant

#exit

