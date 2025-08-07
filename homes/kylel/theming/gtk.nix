{pkgs, ...}: {
  home.packages = with pkgs; [
    nwg-look # For Customizing GTK Applications
  ];

  home.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
  };

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk2.extraConfig = ''
      gtk-application-prefer-dark-theme = 1;
    '';

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
