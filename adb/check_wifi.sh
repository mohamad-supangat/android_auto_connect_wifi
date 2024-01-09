#!/system/bin/sh


#sleep 120
# Wi-Fi network SSID
ssid="Ukurdanuji"

# Website URL to check
url="https://nextcloud.hantamkoding.eu.org"

# Number of times to check the internet connection
num_checks=3

# Counter variable
count=0

# Function to check internet connectivity
check_internet() {
    ping -c 1 "google.com" > /dev/null 2>&1
}


while [ $count -lt $num_checks ]; do
    check_internet

    # Check the exit status of the previous command
    if [ $? -eq 0 ]; then
        echo "Internet connection is active."
        exit 0
    else
        echo "No internet connection. Retrying..."
        count=$((count + 1))
    fi
done


echo "Unable to establish internet connection."
# Disconnect from current Wi-Fi network
svc wifi disable

# Wait for Wi-Fi to disconnect
sleep 5

# Enable Wi-Fi
svc wifi enable

sh /data/adb/login_wifi.sh >> /data/wifi_log.txt

echo "Disconnected from internet. Attempting to reconnect to Wi-Fi network $ssid."

# Wait for Wi-Fi network connection to be established
sleep 10

# Check if Wi-Fi network connection was successful
if ip route | grep default | grep wlan0 > /dev/null; then
    echo "Connected to Wi-Fi network $ssid"
else
    echo "Failed to connect to Wi-Fi network $ssid"
fi

# Wait for Wi-Fi network connection to be established
sleep 10
exit 1


