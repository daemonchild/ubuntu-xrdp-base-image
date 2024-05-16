#!/bin/bash
#
# Author:  Daemonchild
# Purpose: Entrypoint Script for Container
#
echo [Ubuntu Linux Container - XRDP Enabled - Daemonchild]
/usr/sbin/xrdp
/usr/sbin/xrdp-sesman 
/usr/games/cowsay Now point an RDP client at me!
sleep infinity