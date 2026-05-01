{ lib, config, pkgs, ... }: 
let 
  getFrom = url: hash: name: {
    gtk.enable = true;
    x11.enable = true;
    name = name;
    size = 32;
    package = 
      pkgs.runCommand "moveUp" {} ''
        mkdir -p $out/share/icons
        ln -s ${pkgs.fetchzip {
          url = url;
          hash = hash;
        }} $out/share/icons/${name}
      '';
  };

  cursorSettings = getFrom 
    "https://github.com/supermariofps/hatsune-miku-windows-linux-cursors/releases/download/1.2.6/miku-cursor-linux.tar.xz"
    "sha256-qxWhzTDzjMxK7NWzpMV9EMuF5rg9gnO8AZlc1J8CRjY="
    "miku-cursor-linux";
in
{
  config = lib.mkIf config.myModules.home.miku_cursor.enable {
    home.pointerCursor = cursorSettings;

    gtk = {
      enable = true;
      cursorTheme = {
        name = cursorSettings.name;
        package = cursorSettings.package;
      };
      gtk3.extraConfig = {
        "gtk-cursor-theme-name" = cursorSettings.name;
      };
      gtk4.extraConfig = {
        Settings = ''
          gtk-cursor-theme-name=${cursorSettings.name}
        '';
      };
    };
  };
}
