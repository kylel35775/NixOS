{pkgs}:
pkgs.writeShellScriptBin "ipinfo" (builtins.readFile ./ipinfo.sh)
