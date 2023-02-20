#!/bin/bash

# Find Cisco Packet Tracer installer
installer_name_1=CiscoPacketTracer*Ubuntu_64bit.deb
installer_name_2=Cisco_Packet_Tracer_*_Ubuntu_64bit_*.deb
installer_name_3=Cisco*.deb
path_to_pt=$(find /home -name $installer_name_1 -o -name $installer_name_2 -o -name $installer_name_3)

if [[ -z "$path_to_pt" ]]; then
    echo "Packet Tracer installer not found in /home. It must be named like this: $installer_name_1."
    echo "You can download the installer from https://www.netacad.com/portal/resources/packet-tracer"
    echo "or https://skillsforall.com/resources/lab-downloads (login required)."
    exit 1
fi

if [ -e /opt/pt ]; then
  sudo bash ./uninstall.sh
fi

echo "Extracting files"
mkdir packettracer
ar -x $path_to_pt --output=packettracer
tar -xvf packettracer/control.tar.xz --directory=packettracer
tar -xvf packettracer/data.tar.xz --directory=packettracer

sudo cp -r packettracer/usr /
sudo cp -r packettracer/opt /
sudo sed -i 's/packettracer/packettracer --no-sandbox args/' /usr/share/applications/cisco-pt.desktop
sudo sed -i 's/sudo xdg-mime/sudo -u $SUDO_USER xdg-mime/' ./packettracer/postinst 
sudo ./packettracer/postinst

echo "Installing dependencies"
sudo dnf -y install qt5-qt{multimedia,webengine,networkauth,websockets,webchannel,script,location,svg,speech}

sudo rm -rf packettracer
