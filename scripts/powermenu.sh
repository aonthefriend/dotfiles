#!/bin/bash

# Arquivo: ~/dotfiles/scripts/powermenu.sh

options="🔒 Lock\n🔄 Reboot\n⏻ Poweroff\n🔙 Logout\n❌ Cancel"

selected=$(echo -e "$options" | wofi --show dmenu --prompt "Power Menu" --width 300 --height 250 --location center --layer=overlay --style ~/.config/wofi/style.css)

case $selected in
    "🔒 Lock")
        exec swaylock
        ;;
    "🔄 Reboot")
        systemctl reboot
        ;;
    "⏻ Poweroff")
        systemctl poweroff
        ;;
    "🔙 Logout")
        hyprctl dispatch exit
        ;;
    *)
        exit 0
        ;;
esac
