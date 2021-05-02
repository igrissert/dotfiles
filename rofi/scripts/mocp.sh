style="$($HOME/.config/rofi/style/mocp.rasi)"

dir="$HOME/.config/rofi/style/$style"
rofi_command="rofi -theme $dir/mocp.rasi"

# Gets the current status of mpd (for us to parse it later on)
status="$(mpc -Q %state)"
# Defines the Play / Pause option content
if [[ $status == *"[PLAY]"* ]]; then
    play_pause=""
else
    play_pause=""
fi
active=""
urgent=""

## Display if repeat mode is on / off
#tog_repeat=""
#if [[ $status == *"repeat: on"* ]]; then
 #   active="-a 4"
#elif [[ $status == *"repeat: off"* ]]; then
 #   urgent="-u 4"
#else
 #   tog_repeat=" Parsing error"
#fi

# Display if random mode is on / off
#tog_random=""
#if [[ $status == *"random: on"* ]]; then
 #   [ -n "$active" ] && active+=",5" || active="-a 5"
#elif [[ $status == *"random: off"* ]]; then
 #   [ -n "$urgent" ] && urgent+=",5" || urgent="-u 5"
#else
 #   tog_random=" Parsing error"
#fi
stop=""
next="怜"
previous="玲"
pause=""

# Variable passed to rofi
options="$previous\n$play_pause\n$pause\n$stop\n$next"

# Get the current playing song
current=$(mocp -Q "%artist - %title" current)
# If mpd isn't running it will return an empty string, we don't want to display that
if [[ -z "$current" ]]; then
    current="-"
fi

# Spawn the mpd menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -p "  $current" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $previous)
        mocp -r && notify-send -u low -t 1800 " $(mocp -Q "%artist - %title")"
        ;;
    $play_pause)
        mocp -p && notify-send -u low -t 1800 " $(mocp -Q "%artist - %title")"
        ;;
    $stop)
        mocp -s
        ;;
    $pause)
        mocp -P && notify-send -u low -t 1800 " $(mocp -Q "%artist - %title")"
        ;;
    $next)
        mocp --next && notify-send -u low -t 1800 " $(mocp -Q "%artist - %title")"
        ;;
esac

