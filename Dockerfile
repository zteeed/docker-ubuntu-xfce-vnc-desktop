FROM ubuntu:18.04

MAINTAINER Aurelien Duboc "aurelien@duboc.xyz"

ENV HOME /root
ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY=:1

# Install common tools
COPY src/tools.sh /root/tools.sh
RUN /root/tools.sh

# Install noVNC
COPY src/novnc_install.sh /root/novnc_install.sh
RUN /root/novnc_install.sh

# Use custom xfce config
COPY src/xfce-config /root/.config

COPY src/novnc_startup.sh /root/novnc_startup.sh
COPY src/game_startup.sh /root/game_startup.sh

COPY supervisord.conf /etc/supervisord.conf
ENTRYPOINT ["/usr/bin/supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
