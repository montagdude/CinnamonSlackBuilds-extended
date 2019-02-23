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
  python-soupsieve \
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
    ./${package}.SlackBuild || exit 1
    upgradepkg --reinstall --install-new /tmp/csbe/csb/${package}-*.t?z || exit 1
  cd ..
done
