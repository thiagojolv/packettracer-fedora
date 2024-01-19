#!/bin/bash

# Remove Cisco Packet Tracer

if [ -e /opt/pt ]; then
  echo "Uninstalling Cisco Packet Tracer."
  sudo rm -rf /opt/pt /usr/share/applications/cisco*-pt*.desktop
  sudo xdg-desktop-menu uninstall /usr/share/applications/cisco-pt*.desktop
  sudo update-mime-database /usr/share/mime
  sudo gtk-update-icon-cache -t --force /usr/share/icons/gnome
  
  sudo rm -f /usr/local/bin/packettracer
fi