{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      font-awesome
      material-icons
      fira-code
      fira-code-symbols
      nerd-fonts.fira-code
    ];
  };
}
