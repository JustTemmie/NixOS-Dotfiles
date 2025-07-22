{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in
{
  imports =
    [
      (import "${home-manager}/nixos")
    ];

  home-manager.users.twig = { pkgs, ... }: {
    home.packages = [ 
      pkgs.superTuxKart
      #pkgs.vue-language-server
    ];

    home.shell.enableFishIntegration = true;

    programs.ncmpcpp = {
      enable = true;
      package = pkgs.ncmpcpp.override { visualizerSupport = true; };      
      settings = {
        visualizer_type = "spectrum";
        visualizer_color = "118, 116, 115, 114, 113, 186, 181, 216, 218, 219, 184, 216, 213, 207, 206, 205, 204, 203";
        visualizer_spectrum_smooth_look = "no";

        visualizer_fps = 120;
        visualizer_autoscale = false;
        visualizer_spectrum_dft_size = 1;
        visualizer_spectrum_gain = 0;

        display_bitrate = true;

        ignore_leading_the = true;
        ignore_diacritics = true;

        song_status_format = "{{%a{ $4%b$9{ (%y)}} - }{%t}}|{%f}";
      };
    };
    
    programs.fish = {
      enable = true;
      shellInit = "source /etc/nixos/config-files/fish/init.fish";
    };

    programs.git = {
      enable = true;
      diff-so-fancy.enable = true;
      userEmail = "git@beaver.mom";
      userName = "beaver";
      signing.signByDefault = true;

      extraConfig = {
        commit.gpgsign = true;
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/id_ed25519.pub";
        #signByDefault = true;
      };
    };

    programs.vscode = {
      enable = true;
      package = pkgs.vscodium.fhs;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        ms-python.python

        vue.volar
        ritwickdey.liveserver

        rust-lang.rust-analyzer

        llvm-vs-code-extensions.vscode-clangd
    
        mechatroner.rainbow-csv
        oderwat.indent-rainbow
        
        pkief.material-icon-theme
        #t3dotgg.vsc-material-theme-but-i-wont-sue-you
      ];

      profiles.default.userSettings = {
        "files.autoSave" = "afterDelay";
        "files.exclude" = {
          "**/.git" = true;
          "**/.svn" = true;
          "**/.hg" = true;
          "**/CVS" = true;
          "**/.DS_Store" = true;
          "**__pycache__/" = true;
        };

        "editor.fontFamily" = "'Comic Code Ligatures', Regular";
        "editor.fontLigatures" = true;

        "git.enableCommitSigning" = true;
        "git-graph.repository.sign.commits" = true;
        "git-graph.repository.sign.tags" = true;
        "git-graph.repository.commits.showSignatureStatus" = true;
        "git.blame.editorDecoration.enabled" = true;

        "terminal.integrated.shellIntegration.enabled" = true;
        "terminal.integrated.stickyScroll.enabled" = true;

        "workbench.colorTheme" = "Material Theme Darker High Contrast";
        "workbench.iconTheme" = "material-icon-theme";
      };
    };

    programs.ssh = {
      enable = true;
      extraConfig = ''
        identityFile = "~/.ssh/id_ed25519"

        Host hetzner skibidi
          HostName hetzner.beaver.mom
          User temmie

        Host minecraft mc
          HostName bigti.me
          User minecraft

        Host kamatera relay
          HostName kamatera.beaver.mom
          User root


        Host git.gorb.app
          User git
          IdentityFile ~/.ssh/id_rsa
          Port 2022

        Host jellyfin
          HostName 192.168.1.22
          User root

        Host immich
          HostName 192.168.1.23
          User immich

        Host archiver
          HostName 192.168.1.24
          User root

        Host discord-bots bots
          HostName 192.168.1.32
          User discord-bots

        Host satisfactory
          HostName 192.168.1.40
          User steam
      '';
    };
      
    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.05";
  };
}
