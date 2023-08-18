#/bin/bash
# read -p "HASS Configurator version (default=latest): " VERSION
# if ! test -n "$VERSION"; then
    # VERSION="latest"
# fi
# docker container rm --force -v HASSConfigurator
# docker run -d --name="HASSConfigurator" --restart=always --pull=always -p 3218:3218 -e TZ=Europe/Moscow -v /data/HASSConfigurator:/config -v /data/HomeAssistant:/home_assistant_config causticlab/hass-configurator-docker:$VERSION
exec > /data/HASSConfigurator/update_log.txt 2>&1
docker container rm --force -v HASSConfigurator
docker run -d --name="HASSConfigurator" --restart=always --pull=always -p 3218:3218 -e TZ=Europe/Moscow -v /data/HASSConfigurator:/config -v /data/HomeAssistant:/home_assistant_config causticlab/hass-configurator-docker:latest