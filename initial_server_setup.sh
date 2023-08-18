# ssh
sudo apt-get install ssh -y
# webmin
sudo apt-get install curl
curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh && sudo sh setup-repos.sh -f && sudo apt-get -y install webmin --install-recommends
# mc
sudo apt-get install mc -y
# data
sudo mkdir /data
# samba
sudo apt-get install samba -y
sudo systemctl enable smbd
sudo cp /etc/samba/smb.conf /etc/samba/smb_backup.conf
grep -v '^ *#\|^ *$' /etc/samba/smb.conf | sudo tee /etc/samba/smb.conf
sudo systemctl start smbd
sudo smbpasswd -a glebsterx
sudo echo "[data]
    comment =  data
    path =  /data
    public = no
    writable = yes
    read only = no
    guest ok = no
    create mask = 0775
    directory mask = 0775
    force create mode = 0775
    force directory mode = 0775
" >> /etc/samba/smb.conf
sudo systemctl restart smbd
