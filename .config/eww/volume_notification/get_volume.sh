#!/usr/bin/env bash
vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -Eo '[0-9]+.[0-9]+')
echo "$vol * 100" | bc
