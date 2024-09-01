# Cisco Packet Tracer latest version on Fedora

[Watch this script in action](https://youtu.be/iOiwRt_P95Y)

Easily install Cisco Packet Tracer latest version on Fedora. This installation script automatically detects a Cisco Packet Tracer `.deb` in any directory on user home.

## Install

Follow these steps to easily install:

-   Download the Packet Tracer installer from [Cisco's download page](https://www.netacad.com/portal/resources/packet-tracer) and save it in any directory on `/home` using the default filename.
-   Clone this repo to your system
-   `cd` into the cloned repo and make the install script executable: `chmod +x setup.sh`
-   Run `bash setup.sh` **or** `sudo bash setup.sh` and relax. If you not use `sudo`, you can receive no permission alerts when the script looks for installers on you HOME. Only ignore.

Now, the script accepts command line options:
- `-d` or `--directory` allows you to specify a path to the installer. This can turn the script more fast preventing to makes big searchs in the entire user home directory;
- `-h` will show help about the script;
- `--uninstall` uninstall installed Cisco Packet Tracer.

## Supported Fedora release

- [x] Fedora 38 ([F38 is End of Life](https://discussion.fedoraproject.org/t/f38-is-end-of-life/117727))
- [x] Fedora 39
- [x] Fedora 40

## Supported other releases
- [X] Nobara 39
- [X] Nobara 40

_If you try this script in another Fedora release, please report any problem or success case._
