#!/bin/bash

apt-get update
apt-get install -y supervisor wget net-tools vim xfce4 xfce4-terminal x11vnc xvfb firefox xdotool
apt-get autoclean 
apt-get autoremove
rm -rf /var/lib/apt/lists/*
