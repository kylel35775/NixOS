{pkgs}:
pkgs.writeShellScriptBin "wallrizz-launcher" ''
  if pidof WallRizz > /dev/null; then
    pkill WallRizz
  else
    kitty --class wallrizz --single-instance -o allow_remote_control=yes -e WallRizz --disable-notification --preview-mode list
  fi
''
