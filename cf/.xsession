# ~/.xinitrc
#
# startx -- -dpi 102

xrdb -merge ~/.Xresources

# Enforce correct locales from the beginning:
# LC_ALL is unset since it overwrites everything
# LANG=de_DE.UTF-8 is used, except for:
# LC_MESSAGES=C never translates program output
# LC_TIME=en_DK leads to yyyy-mm-dd hh:mm date/time output
unset LC_ALL
export LANG=en_US.UTF-8
export LC_MESSAGES=C
export LC_TIME=en_US.UTF-8

#{{{
#
# MOVED TO /etc/default/keyboard
#
# /etc/default/keybaord  ( KMAP=file )
# ~/.keyboard
# setxkbmap
# loadkeys in console, man keymaps
# setxkbmap -print to examine
#
# Enable zapping (C-A-<Bksp> kills X)
setxkbmap -option terminate:ctrl_alt_bksp -option altwin:prtsc_rwin -option caps:super
# Alt+CapsLock
#setxkbmap -option grp:caps_switch
#}}}




# Enable core dumps in case something goes wrong
ulimit -c unlimited

# Set background color
xsetroot -solid "#000000"

# Disable DPMS turning off the screen
# query with: "xset q"
#
xset -dpms
xset r rate 200 30        # default "660 25"
xset s off
xset s off -dpms

# disable bell
# xset -b


# fcitx
#
#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS=@im=fcitx
##eval "$(dbus-launch --sh-syntax --exit-with-session)"
#fcitx -d &


export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
#ibus &
ibus-daemon -drR --xim &

# HIME 
#
#export GTK_IM_MODULE=hime
#export QT_IM_MODULE=hime
#export XMODIFIERS=@im=hime
#hime &

# xdpyinfo will show correct DPI
# Bug #589485 "Ignores physical display size and calculates based ..."
# https://bugs.launchpad.net/ubuntu/+source/xorg-server/+bug/589485
#
#xrandr --dpi 96
#xrandr --scale 1.25x1.25
#xrandr --fbmm `xrandr | sed -n '/ connected / {s/.* \([0-9]\+\)mm x \([0-9]\+\)mm/\1x\2/p;q}'`
#xrandr --dpi 96
#xrandr --dpi 102 --scale 1.25x1.25
#xrandr --dpi 102

# # radeon {{{
# xrandr --output HDMI-0 --auto
# #xrandr --output HDMI-1 --auto --rotate right --right-of HDMI-0 --primary
# xrandr --output HDMI-1 --auto --rotate right --right-of HDMI-0
# #}}}
# amdgpu {{{
#xrandr --output HDMI-A-0 --auto
#xrandr --output HDMI-A-1 --auto --rotate right --right-of HDMI-A-0
xrandr --output HDMI-1 --auto
xrandr --output HDMI-2 --auto --rotate right --right-of HDMI-1
#}}}

# Start clipboard
# clipit &

# Hide mouse cursor when idle (alt. unclutter-xfixes, xbanish)
# see: /etc/default/unclutter
#unclutter &

# URxvt daemon
urxvtd -q -o -f &

# Start window manager
exec /usr/bin/i3


# https://wiki.archlinux.org/index.php/Display_manager#Starting_applications_without_a_window_manager
# exec google-chrome   :)
