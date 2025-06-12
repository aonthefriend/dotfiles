#!/bin/bash

# Menu de energia com Wofi
chosen=$(printf "⏻ Desligar\n🔄 Reiniciar\n🚪 Logout\n🌙 Suspender\n🔒 Bloquear" | wofi --dmenu --width 250 --height 250 --hide-scroll --prompt "Power Menu")

case "$chosen" in
    "⏻ Desligar") systemctl poweroff ;;
    "🔄 Reiniciar") systemctl reboot ;;
    "🚪 Logout") hyprctl dispatch exit ;;
    "🌙 Suspender") systemctl suspend ;;
    "🔒 Bloquear") loginctl lock-session ;;
    *) exit 1 ;;
esac
