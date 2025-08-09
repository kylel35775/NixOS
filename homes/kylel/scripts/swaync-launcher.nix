{pkgs}:
pkgs.writeShellScriptBin "swaync-launcher" ''
  sleep 0.1
  swaync-client -t &
''
