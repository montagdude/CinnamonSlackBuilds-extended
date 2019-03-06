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

    # Do the build
    export PRINT_PACKAGE_NAME=""
    ./${package}.SlackBuild || exit 1

    # Get package name
    export PRINT_PACKAGE_NAME="yes"
    packagename="$(./${package}.SlackBuild)"

    # Install
    upgradepkg --reinstall --install-new /tmp/csbe/core-upgrades/${packagename} || exit 1
  cd ..
done
