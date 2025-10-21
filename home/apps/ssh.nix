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

      "proxier" = {
        hostname = "192.168.1.4";
        user = "root";
      };
      "caddy" = {
        hostname = "192.168.1.5";
        user = "root";
      };
      "wg" = {
        hostname = "192.168.1.6";
        user = "root";
      };
      "jellyfin" = {
        hostname = "192.168.1.22";
        user = "root";
      };
      "archiver" = {
        hostname = "192.168.1.24";
        user = "root";
      };
      "discord-bots" = {
        hostname = "192.168.1.32";
        user = "discord-bots";
      };
      "satisfactory" = {
        hostname = "192.168.1.40";
        user = "steam";
      };
    };
  };
}
