#!/system/bin/sh

while [[ `getprop sys.boot_completed` -ne 1 ]]
do
       sleep 1
done

# Sleep an additional 2m to ensure init is finished
sleep 120

while true; do
    sh /data/adb/check_wifi.sh >> /sdcard/check_wifi.log
    sleep 60
done

