#!/bin/bash
# logging
exec > /data/PhpMyAdmin/update_log.txt 2>&1
echo "Updating PhpMyAdmin"
sudo docker pull phpmyadmin:latest
sudo docker container rm --force -v PhpMyAdmin
sudo docker run --name PhpMyAdmin -d --restart=always -p 8080:80 -v /data/PhpMyAdmin:/etc/phpmyadmin -e UPLOAD_LIMIT=4G -e MAX_EXECUTION_TIME=900 -e MEMORY_LIMIT=1G phpmyadmin:latest