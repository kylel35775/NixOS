_: {
  home.file = {
    ".config/yazi" = {
      source = builtins.filterSource (path: name: name != "default.nix") ../yazi;
      recursive = true;
    };
  };
}
