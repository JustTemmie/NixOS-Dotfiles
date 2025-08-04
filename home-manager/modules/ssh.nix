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
    extraConfig = ''
      identityFile ~/.ssh/id_ed25519

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
