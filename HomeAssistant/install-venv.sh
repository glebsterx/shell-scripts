#! /bin/bash
apt-get update
apt-get install -y python3 python3-dev python3-venv python3-pip libffi-dev libssl-dev libjpeg-dev zlib1g-dev autoconf build-essential libopenjp2-7 libtiff5 libturbojpeg0-dev tzdata ffmpeg unzip
useradd -rm homeassistant -G dialout
mkdir /srv/homeassistant
python3 -m venv /srv/homeassistant
/srv/homeassistant/bin/python3 -m pip install wheel 
/srv/homeassistant/bin/python3 -m pip install homeassistant
mkdir /home/homeassistant/.homeassistant
chown -R homeassistant:homeassistant /srv/homeassistant
chown -R homeassistant:homeassistant /home/homeassistant/
cat <<EOF > /etc/systemd/system/home-assistant@homeassistant.service
[Unit]
Description=Home Assistant
After=network-online.target

[Service]
Type=simple
User=%i
WorkingDirectory=/home/%i/.homeassistant
ExecStart=/srv/homeassistant/bin/hass -c "/home/%i/.homeassistant"
RestartForceExitStatus=100

[Install]
WantedBy=multi-user.target
EOF
setcap 'cap_net_raw,cap_net_admin+eip' `readlink -f \`which python3\``
systemctl daemon-reload
systemctl start home-assistant@homeassistant
systemctl enable home-assistant@homeassistant
