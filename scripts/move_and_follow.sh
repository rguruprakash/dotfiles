#!/bin/sh
cur_window=$(yabai -m query --windows --window | jq '.id') && \
    yabai -m window --display $1 || yabai -m window --display $2 && \
    yabai -m window --focus ${cur_window}
