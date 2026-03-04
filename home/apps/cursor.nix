{ config, pkgs, ... }: {
  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 48;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        "https://github.com/supermariofps/hatsune-miku-windows-linux-cursors/releases/download/1.2.6/miku-cursor-linux.tar.xz"
        "sha256-6a13eec3928937575bc35435410f276410c899245d0ca98c7f9e1cc23f1f2689"
        "miku-cursor-linux";
  
  # gsettings set org.gnome.desktop.interface cursor-theme miku-cursor-linux
}
