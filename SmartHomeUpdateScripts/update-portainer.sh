#/bin/bash
exec > /data/Portainer/update_log.txt 2>&1
docker pull portainer/portainer-ce:latest
docker stop portainer
docker rm portainer
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /data/Portainer:/data portainer/portainer-ce:latest
