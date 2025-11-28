{ config, pkgs, ... }: {
  home.activation = {
    ssh-permissions = ''
      chmod 700 /home/twig/.ssh
      chmod 600 /home/twig/.ssh/id_ed25519
      chmod 644 /home/twig/.ssh/id_ed25519.pub
    '';
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "hetzner" = {
        hostname = "hetzner.beaver.mom";
        user = "temmie";
      };
      "minecraft" = {
        hostname = "isak.beaver.mom";
        user = "minecraft";
      };
      "relay" = {
        hostname = "relay.beaver.mom";
        user = "root";
      };

      "caddy" = {
        hostname = "192.168.1.2";
        user = "root";
      };
      "proxier" = {
        hostname = "192.168.1.3";
        user = "root";
      };
      "jellyfin" = {
        hostname = "192.168.1.51";
        user = "root";
      };
      "qbittorrent" = {
        hostname = "192.168.1.52";
        user = "root";
      };
      "copyparty" = {
        hostname = "192.168.1.53";
        user = "copyparty";
      };

      "satisfactory" = {
        hostname = "192.168.1.40";
        user = "steam";
      };
    };
  };
}
