final: prev: {
  flameshot = prev.flameshot.overrideAttrs (old: {
    NIX_CFLAGS_COMPILE =
      (old.NIX_CFLAGS_COMPILE or "")
      + "-DUSE_WAYLAND_GRIM=true";

    meta.description =
      old.meta.description
      + " (built with -USE_WAYLAND_GRIM)";
  });
}
