colorRunning="#2A5EE8"
colorStopped="#555"

pid=`pgrep -x "Discord"`

function isRunning {
  if pgrep -x "Discord" > /dev/null; then
    return 0
  fi
    return 1
}

if [[ $# -gt 0 ]]; then
  case "$1" in
      toggle)
          if isRunning; then
              kill $pid; exit 0
          fi
          (discord start &);
          ;;
          *)
              echo 'error: wrong argument'; exit 1
          ;;
  esac
fi

if isRunning; then
    echo "%{F$colorRunning}ﭮ%{F-}"; exit 0
fi
echo "%{F$colorStopped}ﭮ%{F-}"
exit 0
