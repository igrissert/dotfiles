#!/usr/bin/env sh

pkill polybar

sleep 1;

polybar left &
polybar center &
polybar right &
polybar bottom &
