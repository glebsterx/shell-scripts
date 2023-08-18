#!/bin/bash
exec > /data/update_bt_log.txt 2>&1
cd /tmp
wget -O BT500_v0202.zip https://dlcdnets.asus.com/pub/ASUS/wireless/USB-BT500/20200909_LINUX_BT_DRIVER_KERNEL_5.7_COEX_v0202.zip?model=USB-BT500
unzip -o BT500_v0202.zip
cd 20200806_LINUX_BT_DRIVER_RTL8761B_COEX_v0202/20200806_LINUX_BT_DRIVER_RTL8761B_COEX_v0202/
make install INTERFACE=usb
service bluetooth restart
