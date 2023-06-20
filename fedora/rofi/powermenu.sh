#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=' Shutdown'
reboot=' Reboot'
lock=' Lock'
suspend=' Suspend'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-combi-modi drun \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-theme powermenu.rasi
}


# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
		xsecurelock
       ;;
    $suspend)
		mpc -q pause
		amixer set Master mute
		systemctl suspend
        ;;
esac
