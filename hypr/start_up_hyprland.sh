#!/usr/bin/env bash

wpaperd &
waybar &
dunst &
eww d &
exec-once = hyprctl setcursor Bibata-Modern-Classic 24 &
