{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      vue.volar
      ritwickdey.liveserver
      rust-lang.rust-analyzer
      llvm-vs-code-extensions.vscode-clangd
      jnoortheen.nix-ide
      mechatroner.rainbow-csv
      oderwat.indent-rainbow
      pkief.material-icon-theme
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
      # "terminal.integrated.shellIntegration.enabled" = true;
      # "terminal.integrated.stickyScroll.enabled" = true;
      "workbench.colorTheme" = "Material Theme Darker High Contrast";
      "workbench.iconTheme" = "material-icon-theme";
    };
  };
}
