{ config, pkgs, ... }: {
  programs.ssh = {
    enable = true;
    extraConfig = ''
      identityFile "~/.ssh/id_ed25519"

      Host hetzner skibidi
        HostName hetzner.beaver.mom
        User temmie

      Host minecraft mc
        HostName bigti.me
        User minecraft

      Host kamatera relay
        HostName kamatera.beaver.mom
        User root


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
}
