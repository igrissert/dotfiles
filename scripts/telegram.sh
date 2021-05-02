colorRunning="#5682A3"
colorStopped="#555"

pid=`pgrep "telegram"`

function isRunning {
  if pgrep "telegram" > /dev/null; then
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
          (telegram-desktop start &);
          ;;
          *)
              echo 'error: wrong argument'; exit 1
          ;;
  esac
fi

if isRunning; then
    echo "%{F$colorRunning}%{F-}"; exit 0
fi
echo "%{F$colorStopped}%{F-}"
exit 0
