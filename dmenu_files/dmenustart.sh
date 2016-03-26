#!/bin/bash
#
# Choose between default and xft.
# https://www.reddit.com/r/unixporn/comments/2cyzeb/debian_dmenu_not_displaying_ttf_font/
# $ sudo update-alternatives --config dmenu
#  0            /usr/bin/dmenu.default   100       auto mode
#  1            /usr/bin/dmenu.default   100       manual mode
#* 2            /usr/bin/dmenu.xft       50        manual mode
#
#dmenu_run -fn 'Cantarell-10:Regular' -nb '#303030' -nf '#D0C9B1' -sb '#7AA243' -sf '#333333'
#DMENU_P=$(dmenu -v | cut -b 1-9)

DMENU_P=$(cat /etc/lsb-release | grep -i description | cut -b 22-33)
dmenu_run -fn 'Noto Sans-10:regular' -nb '#303030' -nf '#D0C9B1' -sb '#7AA243' -sf '#333333' -p "$DMENU_P"