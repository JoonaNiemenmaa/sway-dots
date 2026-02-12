#!/bin/bash
options="Lock
Poweroff
Reboot
Suspend
Logout"
action=$(echo "$options" | tofi --placeholder-text "select action")

[ -z "$action" ] && exit

confirm=$(echo "Yes
No" | tofi --placeholder-text "confirm $action?")

if [ "$confirm" = "Yes" ]; then
    case "$action" in
        Lock) swaylock -f ;;
        Poweroff) systemctl poweroff ;;
        Reboot) systemctl reboot ;;
        Suspend) systemctl suspend ;;
        Logout) swaymsg exit ;;
    esac
fi
