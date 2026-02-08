{pkgs}: let
  script = pkgs.writeShellScriptBin "xdg-open-hypr" ''
    # Example: firefox, change this to your browser's class name
    BROWSER_CLASS="vivaldi-stable"

    # Get the workspace of the running browser
    BROWSER_WORKSPACE=$(
      hyprctl clients -j | \
      jq -r --arg class "$BROWSER_CLASS" '.[] | select(.class == $class) | .workspace.name' | \
      head -n 1
    )

    # If browser is running, switch to its workspace
    if [ -n "$BROWSER_WORKSPACE" ]; then
      hyprctl dispatch workspace "$BROWSER_WORKSPACE"
    fi

    # Open the link with xdg-open (browser handles URL)
    xdg-open "$1"
  '';

  desktop = pkgs.makeDesktopItem {
    name = "xdg-open Hyprland focus switch";
    desktopName = "xdg-open Hyprland";
    exec = "xdg-open-hypr %u";
    type = "Application";
    mimeTypes = ["x-scheme-handler/http" "x-scheme-handler/https"];
    noDisplay = true;
  };
in {
  inherit script;
  inherit desktop;
}