#!/bin/bash

# Verifica se o arquivo existe
if [[ -f /tmp/last-brightness ]]; then
    saved=$(cat /tmp/last-brightness)
    brightnessctl set "$saved"
else
    brightnessctl set 100%
fi
