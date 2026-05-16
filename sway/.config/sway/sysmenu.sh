#!/bin/bash

case "$@" in
	Suspend)
		systemctl suspend;
		exit 0;
		;;
	Reboot) 
		systemctl reboot;
		exit 0;
		;;
	Poweroff)
		systemctl poweroff;
		exit 0;
		;;
	Logout)
		swaymsg exit;
		exit 0;
		;;
	Close) exit 0;;
esac

echo "Suspend"
echo "Reboot"
echo "Poweroff"
echo "Logout"
echo "Close"

