#!/system/bin/sh
# Check if the device is locked
output=$(dumpsys window policy | grep isStatusBarKeyguard)
if [[ $output == *"isStatusBarKeyguard=true"* ]]; then
    echo "Device is locked"
    input keyevent 26
    # Wait for a few seconds for the screen to turn on
    sleep 1

    # Simulate swiping up to unlock the screen
    input swipe 300 1000 300 500
    input text 1712
    
else
    echo "Device is unlocked"
fi

am start -n com.steinwurf.adbjoinwifi/.MainActivity -e ssid Ukurdanuji
sleep 10
am start -a android.intent.action.VIEW -d http://wifi.jvm/login
sleep 5
am force-stop com.xbrowser.play

