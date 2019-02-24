config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config etc/pam.d/lightdm.new
config etc/pam.d/lightdm-autologin.new
config etc/pam.d/lightdm-greeter.new

config etc/lightdm/lightdm.conf.new
config etc/lightdm/users.conf.new
config etc/lightdm/keys.conf.new
