let
  theme = builtins.readFile ./themes/midnight.theme.css;
in {
  programs.vesktop = {
    enable = true;

    settings = {};

    vencord = {
      useSystem = false; # Plugins and Themes break if using Nixpkgs Vencord (Vencord/Vesktop compatability mismatch?)

      themes = {
        midnight = theme;
      };

      settings = {
        enabledThemes = [
          "midnight.css"
        ];
        themeLinks = [
          # "https://refact0r.github.io/midnight-discord/build/midnight.css"
        ];

        plugins = {
          AlwaysTrust.enabled = true;
          CallTimer.enabled = true;
          DisableCallIdle.enabled = true;
          FakeNitro.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          FriendsSince.enabled = true;
          GameActivityToggle.enabled = true;
          GifPaste.enabled = true;
          HideMedia.enabled = true;
          ImageZoom.enabled = true;
          ImplicitRelationships.enabled = true;
          IrcColors.enabled = true;
          MemberCount.enabled = true;
          MentionAvatars.enabled = true;
          MessageClickActions = {
            enabled = true;
            requireModifier = true;
          };
          MessageLogger.enabled = true;
          MutualGroupDMs.enabled = true;
          NoOnboardingDelay.enabled = true;
          OpenInApp.enabled = true;
          PinDMs.enabled = true;
          ReplaceGoogleSearch = {
            enabled = true;
            customEngineName = "Brave";
            customEngineURL = "https://search.brave.com/search?q=";
          };
          ShikiCodeblocks.enabled = true;
          ShowConnections.enabled = true;
          ShowHiddenChannels.enabled = true;
          ShowMeYourName.enabled = true;
          ShowTimeoutDuration.enabled = true;
          SilentMessageToggle = {
            enabled = true;
            persistState = true;
            autoDisable = false;
          };
          TypingIndicator.enabled = true;
          UserVoiceShow.enabled = true;
          VoiceChatDoubleClick.enabled = true;
          VolumeBooster.enabled = true;
          WhoReacted.enabled = true;
          YoutubeAdblock.enabled = true;
        };
      };
    };
  };
}
