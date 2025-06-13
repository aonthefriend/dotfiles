#!/bin/bash

# Uso: brightness.sh up / down / get

case "$1" in
  up)
    brightnessctl set +10%
    ;;
  down)
    brightnessctl set 10%-
    ;;
  get)
    brightnessctl get
    ;;
  *)
    echo "Uso: $0 {up|down|get}"
    exit 1
    ;;
esac
