#!/bin/bash
exec > /data/update_log.txt 2>&1
/data/update-ha.sh
echo "Home Assistant Updated!"
/data/update-hass-configurator.sh
echo "HASS Configurator Updated!"
/data/update-esphome.sh
echo "ESPHome Updated!"
/data/update-phpmyadmin.sh
echo "PhpMyAdmin Updated!"
/data/update-z2m.sh
echo "ZigBee2MQTT Updated!"
/data/update-mqtt.sh
echo "MQTT Updated!"
/data/backup-db.sh
echo "Database saved!"
/data/update-mariadb.sh
echo "MariaDB Updated!"
/data/update-portainer.sh
echo "Portainer Updated!"
/data/update-bt-driver.sh
echo "BT Driver Updated!"
/data/update-caddy.sh
echo "Caddy Updated!"
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
echo "Server Updated!"
echo "Rebooting..."
reboot