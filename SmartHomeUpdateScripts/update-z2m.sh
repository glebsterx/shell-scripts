#/bin/bash
exec > /data/ZigBee2MQTT/update_log.txt 2>&1
echo "Updating ZigBee2MQTT"
docker pull koenkk/zigbee2mqtt:latest-dev
docker container rm --force -v ZigBee2MQTT
docker run -d \
 --name ZigBee2MQTT \
 --restart=always \
 --device=/dev/ttyACM0 \
 -p 8090:8090 \
 -v /run/udev:/run/udev:ro \
 -v /data/ZigBee2MQTT:/app/data \
 -e TZ=Europe/Moscow \
 koenkk/zigbee2mqtt:latest-dev
#  -e DEBUG=zigbee-herdsman*
exit
