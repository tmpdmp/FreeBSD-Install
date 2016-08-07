#!/bin/sh

mkdir ~/.config
mkdir ~/.config/openbox
cp /usr/local/etc/xdg/openbox/menu.xml ~/.config/openbox/menu.xml
cp /usr/local/etc/xdg/openbox/rc.xml ~/.config/openbox/rc.xml
touch ~/.config/openbox/autostart.sh && chmod +x ~/.config/openbox/autostart.sh
echo "#!/bin/sh" >> ~/.config/openbox/autostart.sh
echo "exec openbox-session" >> ~/.xinitrc

echo "(sleep 2 && tint2) &" >> ~/.config/openbox/autostart.sh
mkdir ~/.config/tint2
cp /usr/local/share/examples/tint2/tint2rc ~/.config/tint2/tint2rc

echo "(sleep 2 && wbar) &" >> ~/.config/openbox/autostart.sh


[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"
echo "dbus_enable=\"YES\"" >> /etc/rc.conf
echo "moused_type=\"auto\"" >> /etc/rc.conf
echo "moused_enable=\"YES\"" >> /etc/rc.conf
echo "nvidia_load=\"YES\"" >> /boot/loader.conf

echo "Section \"Device\"" >> /etc/X11/xorg.conf
echo "Identifier \"Card0\"" >> /etc/X11/xorg.conf
echo "Driver \"nvidia\"" >> /etc/X11/xorg.conf
echo "EndSection" >> /etc/X11/xorg.conf