#!/usr/bin/env bash

if hash terminal-notifier 2> /dev/null; then
    terminal-notifier -message "$*"
else
    /usr/bin/osascript -e "display notification \"$*\" with title \"Terminal\""
fi