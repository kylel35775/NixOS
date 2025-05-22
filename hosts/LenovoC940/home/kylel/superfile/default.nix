_: {
  home.file = {
    ".config/superfile/config.toml".text = builtins.readFile ./config.toml;
    ".config/superfile/hotkeys.toml".text = builtins.readFile ./hotkeys.toml;
  };
}
