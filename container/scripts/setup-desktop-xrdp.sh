#!/bin/bash

#      _                                       _     _ _     _
#   __| | __ _  ___ _ __ ___   ___  _ __   ___| |__ (_) | __| |
#  / _` |/ _` |/ _ \ '_ ` _ \ / _ \| '_ \ / __| '_ \| | |/ _` |
# | (_| | (_| |  __/ | | | | | (_) | | | | (__| | | | | | (_| |
#  \__,_|\__,_|\___|_| |_| |_|\___/|_| |_|\___|_| |_|_|_|\__,_|
#

# Title:	  Install and Configure XFCE Desktop and XRDP
#	File:		  setup-desktop-xrdp.sh
# Version:  1.0
#

echo "[Installing xfce and XRDP]"

# Add Chrome Browser repo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Add Window Manager and Libraries
apt-get update &&            \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      libcairo2-dev              \
      libossp-uuid-dev           \
      libpng-dev                 \
      libjpeg-dev                \
      libpango1.0-dev            \
      libssh2-1-dev              \
      libssl-dev                 \
      libtasn1-bin               \
      libvorbis-dev              \
      libwebp-dev                \
      libpulse-dev               \
      libu2f-udev                \
      libvulkan1                 \
      fonts-liberation           \
      desktop-base               \
      xserver-xorg-core          \
      xserver-xorg-input-all     \
      xauth                      \
      xrdp                       \
      dbus-x11                   \
      locales                    \
      pavucontrol                \
      pulseaudio                 \
      pulseaudio-utils           \
      x11-xserver-utils          \
      xfce4                      \
      xfce4-goodies              \
      xfce4-pulseaudio-plugin    \
      xorgxrdp                   \
      xrdp                       \
      xubuntu-icon-theme         \
      google-chrome-stable &&    \
    apt-get clean &&             \
    rm -rf /var/lib/apt/lists/*

echo "port tcp://:3389" >> /etc/xrdp/xrdp.ini

# Configure PolKit
mkdir -p /etc/polkit-1/localauthority/50-local.d/
cat << EOF > /etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla
[Allow Colord all Users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes
EOF

# Remove keyboard shortcut to allow bash_completion in xfce4-terminal
for u in $(ls /home) ; do echo "DISPLAY=:1 xfconf-query -c xfce4-keyboard-shortcuts -p \"/xfwm4/custom/<Super>Tab\" -r" >> /home/$u/.bashrc ; done

# Configure XFCE4 panel
mv /etc/xdg/xfce4/panel/default.xml /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

# Configure Default Apps
update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/xfce4-terminal 1000
update-alternatives --set x-www-browser $(which google-chrome-stable)

# Desktop Wallpaper
#/etc/alternatives/desktop-background -> /usr/share/images/desktop-base/lines-wallpaper_1920x1080.svg
