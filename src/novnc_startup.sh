#!/bin/bash

NO_VNC_HOME="/root/noVNC"
source /root/.bashrc

## resolve_vnc_connection
VNC_IP=$(hostname -i)

## start noVNC webclient
echo -e "\n------------------ start noVNC  ----------------------------"
echo "$NO_VNC_HOME/utils/launch.sh --vnc localhost:$VNC_PORT --listen $NO_VNC_PORT"
$NO_VNC_HOME/utils/launch.sh --vnc localhost:$VNC_PORT --listen $NO_VNC_PORT &> /root/no_vnc_startup.log &

## log connect options
echo -e "\n\n------------------ noVNC environment started ------------------"
echo -e "\nnoVNC HTML client started:\n\t=> connect via http://$VNC_IP:$NO_VNC_PORT/?password=...\n"

echo -e "\n------------------ /root/*.log ------------------"
tail -f /root/*.log
