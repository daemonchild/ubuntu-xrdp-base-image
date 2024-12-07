#!/bin/bash

#      _                                       _     _ _     _
#   __| | __ _  ___ _ __ ___   ___  _ __   ___| |__ (_) | __| |
#  / _` |/ _` |/ _ \ '_ ` _ \ / _ \| '_ \ / __| '_ \| | |/ _` |
# | (_| | (_| |  __/ | | | | | (_) | | | | (__| | | | | | (_| |
#  \__,_|\__,_|\___|_| |_| |_|\___/|_| |_|\___|_| |_|_|_|\__,_|
#

# Title:	  Entrypoint Script for Container
# File:		  /scripts/entrypoint.sh
# Version:    v1.0
#

echo [Ubuntu Linux Container - XRDP Enabled - Daemonchild]
/usr/sbin/xrdp
/usr/sbin/xrdp-sesman 
/usr/games/cowsay Now point an RDP client at me!
sleep infinity