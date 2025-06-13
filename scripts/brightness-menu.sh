#!/bin/bash

options="🔆 100%\n🔅 75%\n🌗 50%\n🌘 25%\n🌑 10%\n❌ Cancelar"

selected=$(echo -e "$options" | wofi --dmenu --width 300 --height 250 --prompt "Brilho")

case $selected in
  "🔆 100%") brightnessctl set 100% ;;
  "🔅 75%")  brightnessctl set 75% ;;
  "🌗 50%")  brightnessctl set 50% ;;
  "🌘 25%")  brightnessctl set 25% ;;
  "🌑 10%")  brightnessctl set 10% ;;
  *) exit 0 ;;
esac
