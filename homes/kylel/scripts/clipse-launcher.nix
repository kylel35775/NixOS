{pkgs}:
pkgs.writeShellScriptBin "clipse-launcher" ''
  if pidof clipse > /dev/null; then
    pkill clipse
  else
    kitty --class clipse --single-instance -e clipse
  fi
''
