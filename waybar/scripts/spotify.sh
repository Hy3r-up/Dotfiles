#!/bin/sh

status=$(playerctl --player=spotify status 2>/dev/null)

if [[ "$status" == "Playing" ]] || [[ "$status" == "Paused" ]]; then
    artist=$(playerctl --player=spotify metadata artist)
    title=$(playerctl --player=spotify metadata title)
    Totallength=$(playerctl metadata --format "{{ duration(mpris:length) }}")
    Pos=$(playerctl position --format "{{ duration(position) }}")
    echo "$artist - $title [$Pos/$Totallength]"
else
    echo ""
fi
