#!/bin/bash

# Remove Cisco Packet Tracer

if [ -e /opt/pt ]; then
  echo "Removing old version of Packet Tracer from /opt/pt"
  sudo rm -rf /opt/pt /usr/share/applications/cisco*-pt*.desktop
  sudo xdg-desktop-menu uninstall /usr/share/applications/cisco-pt*.desktop
  sudo update-mime-database /usr/share/mime
  sudo gtk-update-icon-cache --force /usr/share/icons/gnome
  
  sudo rm -f /usr/local/bin/packettracer
fi