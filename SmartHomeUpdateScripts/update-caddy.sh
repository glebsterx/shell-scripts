#/bin/sh
exec > /data/Caddy/update_log.txt 2>&1

docker run --init --name=CaddyBuilder --pull=always -it --rm --entrypoint /bin/sh -v /data/Caddy:/caddy caddy:2-builder /caddy/build.sh

docker container rm --force -v Caddy
docker run --init --name=Caddy --restart=always --pull=always -d --entrypoint /bin/sh -v /data/Caddy:/etc/caddy -v /data/Caddy/config:/config -v /data/Caddy/data:/data -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro -p 8081:80 -p 8443:443 -p 2019:2019 -p 8122:8122 -p 3217:3217 -p 6051:6051 -p 8091:8091 caddy:latest /etc/caddy/start.sh