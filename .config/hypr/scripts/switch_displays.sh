#!/bin/bash

if hyprctl monitors | grep -q "HDMI-A-1"; then
  hyprctl keyword monitor eDP-1,disable
  hyprctl keyword monitor HDMI-A-1,preferred,auto,1
else
  hyprctl keyword monitor eDP-1,preferred,auto,auto
  hyprctl keyword monitor ,preferred,auto,auto
fi
