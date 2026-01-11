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
        hostname = "bigti.me";
        user = "root";
        port = 1908;
      };
      "relay" = {
        hostname = "relay.beaver.mom";
        user = "root";
      };

      "gpu" = {
        hostname = "192.168.2.11";
        user = "root";
      };
      "jellyfin" = {
        hostname = "192.168.2.11";
        user = "jellyfin";
      };

      "caddy" = {
        hostname = "192.168.1.2";
        user = "root";
      };
      "proxier" = {
        hostname = "192.168.1.3";
        user = "root";
      };
      "jellyseerr" = {
        hostname = "192.168.1.30";
        user = "root";
      };
      "qbittorrent" = {
        hostname = "192.168.2.101";
        user = "root";
      };
      "copyparty" = {
        hostname = "192.168.2.102";
        user = "root";
      };
      "satisfactory" = {
        hostname = "192.168.3.100";
        user = "twig";
      };
      "palworld" = {
        hostname = "192.168.3.101";
        user = "twig";
      };
    };
  };
}
