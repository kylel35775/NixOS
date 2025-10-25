{
  programs.keepassxc = {
    enable = true;

    settings = {
      Browser = {
        Enabled = true;
      };

      GUI = {
        AdvancedSettings = true;
        ApplicationTheme = "dark";
        HidePasswords = true;

        LaunchAtStartup = true;

        ShowTrayIcon = true;
        MinimizeToTray = true;
        MinimizeOnStartup = true;
        MinimizeOnClose = true;
      };

      Security = {
        LockDatabaseIdle = true;
        LockDatabaseIdleSeconds = 240;
      };
    };
  };
}