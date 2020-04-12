#!/bin/bash

source /root/.bashrc
NO_VNC_HOME="/root/noVNC"

## resolve_vnc_connection
VNC_IP=$(hostname -i)

## start noVNC webclient
echo -e "\n------------------ start noVNC  ----------------------------"
echo "$NO_VNC_HOME/utils/launch.sh --vnc localhost:$VNC_PORT --listen $NO_VNC_PORT"
$NO_VNC_HOME/utils/launch.sh --vnc localhost:$VNC_PORT --listen $NO_VNC_PORT
