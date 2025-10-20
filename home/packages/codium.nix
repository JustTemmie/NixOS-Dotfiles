# i really need to fix my plugins
{ config, lib, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    # does this work? do i have 2 gccs? who knows!
    package = pkgs.vscodium.fhsWithPackages (ps: with ps; [ ccls pkg-config ]);
    profiles.default.extensions = with pkgs.vscode-extensions; [
      pkief.material-icon-theme
      vue.volar
      leonardssh.vscord
      tamasfe.even-better-toml
      oderwat.indent-rainbow
      ritwickdey.liveserver
#      ccls-project.ccls # c language server
        # magicstack.magicpython
	# subframe7536.theme-maple
      jnoortheen.nix-ide
      ms-python.python
#      13xforever.language-x86-64-assembly
      mechatroner.rainbow-csv
      rust-lang.rust-analyzer
      tauri-apps.tauri-vscode
      tomoki1207.pdf
    ];


    profiles.default = {
      keybindings = [
        {
          "key" = "ctrl+d";
          "command" = "-editor.action.addSelectionToNextFindMatch";
          "when" = "editorFocus";
        }
        {
          "key" = "ctrl+d";
          "command" = "editor.action.copyLinesDownAction";
          "when" = "editorTextFocus && !editorReadonly";
        }
      ];

      userSettings = {
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
        "workbench.colorTheme" = "Maple Dark";
        "workbench.iconTheme" = "material-icon-theme";
        "vscord.status.idle.timeout" = 900;
        "vscord.status.idle.disconnectOnIdle" = true;
        "vscord.app.name" = "VSCodium";
        "liveServer.settings.donotVerifyTags" = true;
      };
    };
  };
}
