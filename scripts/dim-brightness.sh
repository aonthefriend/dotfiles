#!/bin/bash

# Armazena brilho atual em um arquivo temporário
brightnessctl get > /tmp/last-brightness

# Diminui o brilho para 10%
brightnessctl set 10%
