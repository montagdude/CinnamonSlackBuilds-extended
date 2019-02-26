#!/bin/sh
#
# Additional packages for Cinnamon.

LIST=" \
gnome-common \
mate-common \
glade \
gtksourceview3 \
enchant2 \
gspell \
libpeas \
clutter-gst \
libwebp \
geoclue2 \
hyphen \
brotli \
woff2 \
webkit2gtk \
appstream-glib \
yelp-xsl \
yelp-tools \
yelp \
file-roller \
libcryptui \
lightdm \
slick-greeter \
lightdm-settings \
xed \
xplayer-plparser \
xplayer \
xreader \
xviewer \
pix \
nemo-fileroller \
nemo-seahorse \
"

for package in $LIST; do
  cd $package
    chmod +x ${package}.SlackBuild
    ./${package}.SlackBuild || exit 1
    upgradepkg --reinstall --install-new /tmp/csbe/additions/${package}-*.t?z || exit 1
  cd ..
done
