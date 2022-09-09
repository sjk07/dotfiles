#!/usr/bin/env bash

languages=$(echo "golang rust typescript nodejs" | tr ' ' '\n')
core_utils=$(echo "xargs find mv sed awk" | tr ' ' '\n')

selected=$(printf '%s\n%s' "$languages" "$core_utils" | fzf)
read -rp "query: " query

if printf '%s' "$languages" | grep -qs "$selected"; then
    tmux neww bash -c "curl cht.sh/$selected/$(echo "$query" | tr ' ' '+') & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl cht.sh/$selected/$(echo "$query" | tr ' ' '+') & while [ : ]; do sleep 1; done"
fi
