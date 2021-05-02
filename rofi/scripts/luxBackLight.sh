style="$($HOME/.config/rofi/style/backlight.rasi)"

dir="$HOME/.config/rofi/style/$style"
rofi_command="rofi -theme $dir/backlight.rasi"

status="$(lux -g)"

icon_up="瀞"
icon_down="漢"
icon_set="滛"

notify="notify-send -u low -t 1500"
options="$icon_up\n$icon_set\n$icon_down"

chosen="$(echo -e "$options" | $rofi_command -p "$status" -dmenu -selected-row 1)"

case $chosen in
  $icon_up)
    lux -a 30% && $notify "Brightness Up $icon_up"
    ;;

  $icon_down)
    lux -s 30% && $notify "Brightness Down $icon_down"
    ;;

  $icon_set)
    lux -S 70% && $notify "Brightness Set $icon_set"
    ;;

esac
