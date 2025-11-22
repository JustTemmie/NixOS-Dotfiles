{ config, pkgs, ... }: {
  programs.cava = {
    enable = true;
  };

  
  programs.rmpc = {
    enable = true;
      # cava: (
      #   framerate: 60, // default 60
      #   autosens: true, // default true
      #   sensitivity: 100, // default 100
      #   // lower_cutoff_freq: 50, // not passed to cava if not provided
      #   // higher_cutoff_freq: 10000, // not passed to cava if not provided
      #   input: (
      #     method: Fifo,
      #     source: "/tmp/mpd.fifo",
      #     // sample_rate: 44100,
      #     // channels: 2,
      #     // sample_bits: 16,
      #   ),
      #   smoothing: (
      #     noise_reduction: 77, // default 77
      #     monstercat: false, // default false
      #     waves: false, // default false
      #   ),
      #   // this is a list of floating point numbers thats directly passed to cava
      #   // they are passed in order that they are defined
      #   eq: []
      # )
    config = ''
    (
    )
    '';
  };
}
