FROM ubuntu:18.04

MAINTAINER Aurelien Duboc "aurelien@duboc.xyz"

ENV HOME=/root \
    TERM=xterm \
    DEBIAN_FRONTEND=noninteractive \
    DISPLAY=:1

# Install common tools
COPY src/tools.sh /root/tools.sh
RUN /root/tools.sh

# Install noVNC
COPY src/novnc_install.sh /root/novnc_install.sh
RUN /root/novnc_install.sh

# Use custom xfce config
COPY src/xfce-config /root/.config

# Add startup shell scripts
COPY src/novnc_startup.sh /root/novnc_startup.sh
COPY src/game_startup.sh /root/game_startup.sh

# Manage all processes with supervisor
COPY supervisord.conf /etc/supervisord.conf
ENTRYPOINT ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
