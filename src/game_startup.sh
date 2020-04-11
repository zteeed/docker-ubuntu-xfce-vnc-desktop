#!/bin/sh

/usr/bin/firefox --display :1 --kiosk --private-window $GAME_URL & 
# Fullscreen
xdotool search --sync --onlyvisible --class "Firefox" windowactivate key F11
# Set zoom to 80%
xdotool search --sync --onlyvisible --class "Firefox" windowactivate key ctrl+minus
xdotool search --sync --onlyvisible --class "Firefox" windowactivate key ctrl+minus
tail -f /dev/null
