echo "[Installing xfce and XRDP]"

apt-get update &&            \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      libcairo2-dev              \
      libossp-uuid-dev           \
      libpng-dev                 \
      libjpeg-dev                 \
      libpango1.0-dev            \
      libssh2-1-dev              \
      libssl-dev                 \
      libtasn1-bin               \
      libvorbis-dev              \
      libwebp-dev                \
      libpulse-dev               \
      libu2f-udev \
      desktop-base \
      xfce4            \
      xfce4-goodies    \
      xauth            \
      xrdp              \
      dbus-x11           && \
    apt-get clean &&             \
    rm -rf /var/lib/apt/lists/*

echo "port tcp://:3389" >> /etc/xrdp/xrdp.ini

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
