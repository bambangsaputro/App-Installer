#!/bin/bash
varname=$(basename $HOME/../usr/var/lib/proot-distro/installed-rootfs/debian/home/*)

proot-distro login debian --user $varname --shared-tmp -- env DISPLAY=:1.0 wget https://download.jetbrains.com/webstorm/WebStorm-2023.3.3-aarch64.tar.gz -O webstorm.tar.gz
proot-distro login debian --user $varname --shared-tmp -- env DISPLAY=:1.0 sudo -S apt install default-jdk -y
proot-distro login debian --user $varname --shared-tmp -- env DISPLAY=:1.0 sudo -S tar xzf webstorm.tar.gz
proot-distro login debian --user $varname --shared-tmp -- env DISPLAY=:1.0 sudo -S mv WebStorm-233.14015.89 /opt/webstorm
proot-distro login debian --user $varname --shared-tmp -- env DISPLAY=:1.0 sudo -S chmod +x /opt/webstorm/bin/webstorm.sh

# Create the desktop entry
echo "[Desktop Entry]
Name=WebStorm
Comment=The JavaScript and TypeScript IDE
Exec=proot-distro login debian --user $varname --shared-tmp -- env DISPLAY=:1.0 /opt/webstorm/bin/./webstorm.sh
Icon=webstorm
Type=Application
StartupNotify=true
Categories=Development;
Path=
Terminal=false
" > $HOME/Desktop/webstorm.desktop

chmod +x $HOME/Desktop/webstorm.desktop
cp $HOME/Desktop/webstorm.desktop $HOME/../usr/share/applications/webstorm.desktop
