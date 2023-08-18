#!/bin/bash
# logging
exec > /data/MQTT/update_log.txt 2>&1
echo "Updating MQTT"
sudo docker pull eclipse-mosquitto
sudo docker container rm --force -v MQTT
sudo docker run --name MQTT --restart=always -d -p 1883:1883 -p 9001:9001 -v /data/MQTT/config/mosquitto.conf:/mosquitto/config/mosquitto.conf -v /data/MQTT/data:/mosquitto/data -v /data/MQTT/log:/mosquitto/log eclipse-mosquitto
