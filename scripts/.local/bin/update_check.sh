#!/bin/bash
if checkupdates | grep -q .; then
    notify-send "Arch Update" "There are updates available for your system!"
else
    notify-send "Arch Update" "Your system is up to date!"
fi

