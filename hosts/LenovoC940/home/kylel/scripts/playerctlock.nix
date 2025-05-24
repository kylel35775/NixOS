{pkgs}:
pkgs.writeShellScriptBin "playerctlock" (builtins.readFile ./playerctlock.sh)
