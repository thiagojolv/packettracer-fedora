# Cisco Packet Tracer latest version on Fedora

Easily install Cisco Packet Tracer latest version on Fedora. This installation script automatically detects a Cisco Packet Tracer `.deb` in any directory on user home.

## Install

Follow these steps to easily install:

-   Download the Packet Tracer installer from [Cisco's download page](https://www.netacad.com/portal/node/488) and save it in any directory on `/home` using the default filename.
-   Clone this repo to your system
-   `cd` into the cloned repo and make the install script executable: `chmod +x install.sh`
-   Run `bash install.sh` **or** `sudo bash install.sh` and relax. If you not use `sudo`, you can receive no permission alerts when the script looks for installers on you HOME. Only ignore.

## Supported Fedora release

- [x] Fedora 38 ([F38 is End of Life](https://discussion.fedoraproject.org/t/f38-is-end-of-life/117727))
- [x] Fedora 39
- [x] Fedora 40

## Supported other releases
- [X] Nobara 39

## Uninstall

-   If you need to uninstall, make sure the uninstall script is executable: `chmod +x uninstall.sh`
-   Run `sudo bash uninstall.sh`

_If you try this script in another Fedora release, please report any problem or success case._
