#!/bin/bash
options="Lock
Poweroff
Reboot
Suspend
Logout"
action=$(echo "$options" | tofi --prompt-text "Select action:")

[ -z "$action" ] && exit

confirm=$(echo "Yes
No" | tofi --prompt-text "Confirm $action?")

if [ "$confirm" = "Yes" ]; then
    case "$action" in
        Lock) swaylock -f ;;
        Poweroff) systemctl poweroff ;;
        Reboot) systemctl reboot ;;
        Suspend) systemctl suspend ;;
        Logout) swaymsg exit ;;
    esac
fi
