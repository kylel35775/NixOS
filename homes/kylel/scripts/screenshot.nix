{pkgs}:
pkgs.writeShellScriptBin "screenshot" ''
  hyprshot --freeze --mode=region --clipboard-only
''
