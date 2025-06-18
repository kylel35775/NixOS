{pkgs}:
pkgs.writeShellScriptBin "flameshot-gui" ''
  env QT_SCALE_FACTOR=0.8 flameshot gui
''
