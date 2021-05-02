colorRunning="#90C2FF"
colorStopped="#555"

pid=`pgrep -x "zoom"`

function isRunning {
  if pgrep -x "zoom" > /dev/null; then
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
          (zoom start &);
          ;;
          *)
              echo 'error: wrong argument'; exit 1
          ;;
  esac
fi

if isRunning; then
    echo "%{F$colorRunning}%{F-}"; exit 0
fi
echo "%{F$colorStopped}%{F-}"
exit 0
