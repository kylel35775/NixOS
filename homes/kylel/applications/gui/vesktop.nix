{
  programs.vesktop = {
    enable = true;

    settings = {};

    vencord = {
      useSystem = true;

      themes = {
        midnight = "https://refact0r.github.io/midnight-discord/build/midnight.css";
      };

      settings = {
        enabledThemes = ["midnight.css"];

        plugins = {
          MessageLogger.enabled = true;
          FakeNitro.enabled = true;
        };
      };
    };
  };
}
