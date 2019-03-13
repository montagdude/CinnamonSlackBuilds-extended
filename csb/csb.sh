#!/bin/sh
#
# Builds Cinnamon. Based on build-cinnamon.sh script from CSB.

LIST=" \
  libxkbcommon \
  setproctitle \
  ptyprocess \
  autoconf-archive \
  cjs \
  cracklib \
  pam \
  python-pam \
  accountsservice \
  cinnamon-desktop \
  pangox-compat \
  libgnomekbd \
  xapps \
  cinnamon-session \
  libgusb \
  colord \
  libgtop \
  cinnamon-settings-daemon \
  gnome-menus \
  krb5 \
  cinnamon-menus \
  cinnamon-control-center \
  zenity \
  cogl \
  clutter \
  clutter-gtk \
  muffin \
  libgee \
  caribou \
  pexpect \
  BeautifulSoup \
  lxml \
  metacity \
  polib \
  cinnamon-translations \
  nemo \
  python-xapp \
  psutil \
  cinnamon-screensaver \
  mint-y-theme \
  mint-y-icons \
  rubygem-sass \
  mint-themes \
  cinnamon \
  pia-manager \
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
    upgradepkg --reinstall --install-new /tmp/csbe/csb/${packagename} || exit 1
  cd ..
done
