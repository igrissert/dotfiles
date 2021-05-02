#!/bin/sh

case "$1" in
    --toggle)
        if [ "$(pgrep discord)" ]; then
            pkill -f discord
        else
              discord &
        fi
        ;;
    *)
        if [ "$(pgrep discord)" ]; then
            echo "run "
        else
            echo " not"
        fi
        ;;
esac
