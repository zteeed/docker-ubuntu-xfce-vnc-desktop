#!/bin/sh

# Disable screensaver and power management
xset -dpms &
xset s noblank &
xset s off &

# Manage VNC passwords
mkdir -p /root/.vnc
x11vnc -storepasswd "$USER_PASSWORD" /root/.vnc/user_password
x11vnc -storepasswd "$ADMIN_PASSWORD" /root/.vnc/admin_password

/usr/bin/firefox --display :1 --kiosk --private-window $GAME_URL & 
# Fullscreen
xdotool search --sync --onlyvisible --class "Firefox" windowactivate key F11
# Set zoom to 80%
xdotool search --sync --onlyvisible --class "Firefox" windowactivate key ctrl+minus
xdotool search --sync --onlyvisible --class "Firefox" windowactivate key ctrl+minus
tail -f /dev/null
