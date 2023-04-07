# Cisco Packet Tracer latest version on Fedora

Easily install Cisco Packet Tracer latest version on Fedora. This installation script automatically detects a Cisco Packet Tracer `.deb` in any directory on `/home`.

## Supported Fedora versions

- 34
- 35
- 36
- 37
- 38

## Install

Follow these steps to easily install:

-   Download the Packet Tracer installer from [Cisco's download page](https://www.netacad.com/portal/node/488) and save it in any directory on `/home` using the default filename.
-   Clone this repo to your system
-   `cd` into the cloned repo and make the install script executable: `chmod +x install.sh`
-   Run `bash install.sh` **or** `sudo bash install.sh` and relax. If you not use `sudo`, you can receive no permission alerts when the script looks for installers on you HOME. Only ignore.

## Uninstall

-   If you need to uninstall, make sure the uninstall script is executable: `chmod +x uninstall.sh`
-   Run `sudo bash uninstall.sh`

_If you try this script in another Fedora release, please report any problem or success case._
