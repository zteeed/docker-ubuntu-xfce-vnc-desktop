#!/bin/bash

NO_VNC_HOME="/root/noVNC"

echo "Install noVNC - HTML5 based VNC viewer"
mkdir -p $NO_VNC_HOME/utils/websockify
wget -qO- https://github.com/novnc/noVNC/archive/v1.0.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME
wget -qO- https://github.com/novnc/websockify/archive/v0.6.1.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify
chmod +x -v $NO_VNC_HOME/utils/*.sh
ln -s $NO_VNC_HOME/vnc_lite.html $NO_VNC_HOME/index.html
