{pkgs}:
pkgs.writeShellScriptBin "infonlock" (builtins.readFile ./infonlock.sh)
