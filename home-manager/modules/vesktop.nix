{
  programs.vesktop = {
    enable = true;
    settings = {
      appBadge = false;
      arRPC = true;
      checkUpdates = false;
      customTitleBar = true;
      disableMinSize = true;
      minimizeToTray = true;
      tray = true;
      splashBackground = "#000000";
      splashColor = "#ffffff";
      splashTheming = true;
      staticTitle = true;
      hardwareAcceleration = true;
      discordBranch = "stable";
    };
    vencord.themes = {
      myTheme = ''
        * {
          font-family: 'Comic Code Ligatures', Regular !important;
          font-feature-settings: "liga" 1;
        }

        /* emojis and bot thingy */
        .buttons__74017, .channelAppLauncher_e6e74f {
          display: none;
        } 


        /* play again */
        .container__675e5 {
          display: none;
        }
      '';
    };
    vencord.settings = {
      autoUpdate = false;
      autoUpdateNotification = false;
      notifyAboutUpdates = false;
      useQuickCss = true;
      disableMinSize = true;
      enabledThemes = [ "myTheme.css" ];
      plugins = {
        AccountPanelServerProfile.enabled = true;
        BetterUploadButton.enabled = true;
        BiggerStreamPreview.enabled = true;
        BlurNSFW.enabled = true;
        CallTimer.enabled = true;
        ClearURLs.enabled = true;
        ConsoleJanitor.enabled = true;
        CopyEmojiMMarkdown.enabled = true;
        copyFileContents.enabled = true;
        copyUserURLs.enabled = true;
        crashHandler.enabled = true;
        Dearrow.enabled = true;
        Decor.enabled = true;
        DisableCallIdle.enabled = true;
        Experiments.enabled = true;
        ExpressionCloner.enabled = true;
        FakeNitro.enabled = true;
        FavoriteEmojiFirst.enabled = true;
        FavoriteGifSearch.enabled = true;
        FixImagesQuality.enabled = true;
        FixSpotifyEmbeds.enabled = true;
        FixYoutubeEmbeds.enabled = true;
        ForceOwnerCrown.enabled = true;
        FriendInvites.enabled = true;
        FriendsSince.enabled = true;
        FullSearchContext.enabled = true;
        FullUserInChatbox.enabled = true;
        GameActivityToggle.enabled = true;
        IgnoreActivities.enabled = true;
        ImageZoom.enabled = true;
        IrcColors = {
          enabled = true;
          applyColorOnlyToUsersWithoutColor = true;
        };
        LoadingQuotes.enabled = true;
        MentionAvatars.enabled = true;
        MessageLogger = {
          enabled = true;
          ignoreUsers = [ 870019731527204875 ];
          ignoreChannels = [ 1206056733982724157 1206052728925720626 ];
        };
        MutualGroupDMs.enabled = true;
        NewGuildSettings.enabled = true;
        NoDevtoolsWarning.enabled = true;
        NoF1.enabled = true;
        NoMosaic.enabled = true;
        NoOnboardingDelay.enabled = true;
        NoProfileThemes.enabled = true;
        OnePingPerDM.enabled = true;
        PermissionViewer.enabled = true;
        petpet.enabled = true;
        PictureInPicture.enabled = true;
        PlatformIndicators.enabled = true;
        QuickReply.enabled = true;
        RelationshipNotifier.enabled = true;
        ReplyTimestamp.enabled = true;
        ReviewDB.enabled = true;
        RoleColorEverywhere.enabled = true;
        SendTimestamps.enabled = true;
        ServerInfo.enabled = true;
        ShikiCodeblocks.enabled = true;
        ShowHiddenThings.enabled = true;
        ShowMeYourName = {
          enabled = true;
          displayNames = true;
        };
        SpotifyCrack.enabled = true;
        StartupTimings.enabled = true;
        SuperReactionTweaks = {
          enabled = true;
          superReactByDefault = false;
          superReactionPlayingLimit = 0;
        };
        ThemeAttributes.enabled = true;
        TypingIndicator.enabled = true;
        TypingTweaks.enabled = true;
        Unindent.enabled = true;
        UnlockedAvatarZoom.enabled = true;
        UserVoiceShow.enabled = true;
        ValidReply.enabled = true;
        ValidUser.enabled = true;
        VencordToolbox.enabled = true;
        ViewIcons.enabled = true;
        ViewRaw.enabled = true;
        VoiceChatDoubleClick.enabled = true;
        VoiceDownload.enabled = true;
        VolumeBooster.enabled = true;
        WebKeybinds.enabled = true;
        WebScreenShareFixes.enabled = true;
        WhoReacted.enabled = true;
        YoutubeAdblock.enabled = true;
      };
    };
  };
}  
