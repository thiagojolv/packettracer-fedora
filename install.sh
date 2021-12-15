#!/bin/bash

if [ -e /opt/pt ]; then
  echo "Removing old version of Packet Tracer from /opt/pt"
  sudo rm -rf /opt/pt
  sudo rm -rf /usr/share/applications/cisco-pt.desktop
  sudo rm -rf /usr/share/applications/cisco-ptsa.desktop
  sudo rm -rf /usr/share/applications/cisco7-pt.desktop
  sudo rm -rf /usr/share/applications/cisco7-ptsa.desktop
  sudo xdg-desktop-menu uninstall /usr/share/applications/cisco-pt.desktop
  sudo xdg-desktop-menu uninstall /usr/share/applications/cisco-ptsa.desktop
  sudo update-mime-database /usr/share/mime
  sudo gtk-update-icon-cache --force /usr/share/icons/gnome
  
  sudo rm -f /usr/local/bin/packettracer
fi

echo "Extracting files"
ar -x CiscoPacketTracer_810_Ubuntu_64bit.deb
tar -xvf control.tar.xz
tar -xvf data.tar.xz

mv cisco-pt.desktop usr/share/applications/cisco-pt.desktop
sudo cp -r usr /
sudo cp -r opt /
sudo ./postinst

echo "Installing dependencies"
sudo dnf install -y \
  qt5-qtmultimedia.x86_64 \
  qt5-qtwebengine.x86_64 \
  qt5-qtnetworkauth.x86_64 \
  qt5-qtwebsockets.x86_64 \
  qt5-qtwebchannel.x86_64 \
  qt5-qtscript.x86_64 \
  qt5-qtlocation.x86_64 \
  qt5-qtsvg.x86_64 \
  qt5-qtspeech
