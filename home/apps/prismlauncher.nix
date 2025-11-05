{ pkgs, ... }: {
  home.packages = [
    (pkgs.prismlauncher.override {
      additionalPrograms = with pkgs; [
        stable.ffmpeg # used by a couple mods
        stable.vlc # used by watermedia
        
        # used by prismlauncher itself
        glfw
        openal
      ];

      jdks = with pkgs; [
        stable.openjdk8
        stable.openjdk17
        stable.openjdk21
        
        stable.zulu17
        stable.zulu21
      ];
    })
  ];
}