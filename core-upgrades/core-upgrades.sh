#!/bin/sh
#
# Upgrades some Slackware 14.2 core packages to their versions from -current
# using Pat Volkerding's SlackBuild scripts with minor modifications. One
# exception: upower version is 0.99.7; -current still has 0.9.23. Version 0.99.x
# is required for power management settings to work in Cinnamon when a battery
# is present.

LIST=" \
python3 \
python-setuptools \
meson \
ninja \
vala \
mozjs52 \
freetype \
dejavu-fonts-ttf \
liberation-fonts-ttf \
sazanami-fonts-ttf \
sinhala_lklug-font-ttf \
tibmachuni-font-ttf \
ttf-indic-fonts \
ttf-tlwg \
urw-core35-fonts-otf \
wqy-zenhei-font-ttf \
fontconfig \
harfbuzz \
atk \
glib2 \
libepoxy \
cairo \
pango \
gdk-pixbuf2 \
gtk+3 \
polkit \
libwacom \
json-glib \
upower \
pygobject \
pygobject3 \
dbus-python \
python-pillow \
libmbim \
libqmi \
ModemManager \
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
