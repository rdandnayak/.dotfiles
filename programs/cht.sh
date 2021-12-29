#!/usr/bin/env bash

languages=$(echo "javascript typescript angular node" | tr " " "\n")
core_utils=$(echo "find xargs sed awk" | tr " " "\n")


selected=$(echo  -e "$languages\n$core_utils" | fzf)

read -p "GIVE ME YOUR QUERY: " query

if echo "$languages" | grep -qs $selected; then
  tmux split-window -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
  tmux split-window -h bash -c "curl cht.sh/$selected~$query | less"
fi
