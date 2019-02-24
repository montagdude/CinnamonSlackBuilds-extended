#!/bin/sh
#
# Additional packages for Cinnamon.

LIST=" \
gnome-common \
mate-common \
lightdm \
slick-greeter \
lightdm-settings \
glade \
gtksourceview3 \
enchant2 \
gspell \
libpeas \
xed \
yelp-xsl \
yelp-tools \
xviewer \
pix \
clutter-gst \
xplayer-plparser \
xplayer \
libwebp
geoclue2
"

for package in $LIST; do
  cd $package
    chmod +x ${package}.SlackBuild
    ./${package}.SlackBuild || exit 1
    upgradepkg --reinstall --install-new /tmp/csbe/additions/${package}-*.t?z || exit 1
  cd ..
done
