CinnamonSlackBuilds-extended
================================================================================
This repository is an extension to Willy Sudiarto Raharjo's excellent
Cinnamon SlackBuilds (https://cinnamonslackbuilds.github.io/). It is a source
repository only; it contains SlackBuild scripts to build everything, but no
binary packages are included. The main purposes of this repository are:

* Get the latest Cinnamon DE working on something that is as close as possible
  to stock Slackware 14.2.
* Implement some patches, core Slackware package upgrades, and other fixes to
  get a fully functioning DE.
* Add additional apps and tools from the Linux Mint source tree (and, as needed,
  their dependencies).

Please note that some core Slackware packages are upgraded during this process.
As a result, it is possible that some of the remaining packages will require a
rebuild or upgrade, and some third-party software (e.g., things from
SlackBuilds.org) may not compile / function properly without some changes. I
will try to account for or note these incompatibilities to the extent possible,
but please note that this setup is not officially supported in any way, and you
should be will to work through any problems that arise. The core Slackware
packages that are upgraded are all in the core-upgrades directory.

Note: this repository is not to be confused with the csb-extras repository by
Skaendo: https://gitlab.com/skaendo/csb-extras, which also fulfills the third
bullet point above.

Installation
================================================================================
It is recommended to start with a clean, up-to-date Slackware / Slackware64 14.2
installation. If preferred, you can leave out the kde, kdei, and xfce groups.
First, in core-upgrades, enter your preferred Slackware-current mirror in
the file called mirror (or leave the default, but it may not be optimal). Next,
create a user and group for lightdm:

$ groupadd -g 800 lightdm  
$ useradd -d /var/lib/lightdm -s /bin/false -u 800 -g 800 lightdm  

The next step is to build. To speed things along, you may want to set MAKEFLAGS
corresponding to the number of cores on your machine. For instance, if you have
4 cores:

export MAKEFLAGS="-j 4"

Then, the following steps should build and install everything (must be run as
root):

$ cd core-upgrades  
$ ./core-upgrades.sh  
$ cd ../csb  
$ ./csb.sh  
$ cd ../additions  
$ ./additions.sh  

Compiled packages are placed in /tmp/csbe/core-upgrades, /tmp/csbe/csb,
and /tmp/csbe/additions, respectively (they are already installed after running
the commands above). Next, run xwmconfig as root and choose cinnamon-session.
Finally, edit /etc/rc.d/rc.4 and add this near the top (just below echo
"Starting up X11 session manager..."):

if [ -x /usr/bin/lightdm ]; then  
  exec /usr/bin/lightdm  
fi  

Reboot, and if you have inittab set to boot to runlevel 4, you should be
greeted by the slick-greeter lightdm greeter screen. Make sure cinnamon-session
is selected, and log in to your Cinnamon desktop!

Post-installation
================================================================================
Some other things you may want that I haven't included here:

* ffmpeg, gst-libav, non-free codecs: support for playing certain video types
  in xplayer (available on SBo)
