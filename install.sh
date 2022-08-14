#!/bin/bash

# Find Cisco Packet Tracer installer
installer_name_1=CiscoPacketTracer*Ubuntu_64bit.deb
installer_name_2=Cisco_Packet_Tracer_*_Ubuntu_64bit_*.deb
installer_name_3=Cisco*.deb
path_to_pt=$(find /home -name $installer_name_1 -o -name $installer_name_2 -o -name $installer_name_3)

if [[ -z "$path_to_pt" ]]; then
    echo "Packet Tracer installer not found in /home. It must be named like this: $installer_name."
    echo "You can download the installer from www.netacad.com/portal/node/488."
    exit 1
fi

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
mkdir packettracer
ar -x $path_to_pt --output=packettracer
tar -xvf packettracer/control.tar.xz --directory=packettracer
tar -xvf packettracer/data.tar.xz --directory=packettracer

sudo cp -r packettracer/usr /
sudo cp -r packettracer/opt /
sudo sed -i 's/packettracer/packettracer --no-sandbox args/' /usr/share/applications/cisco-pt.desktop
sudo ./packettracer/postinst

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

sudo rm -rf packettracer
