{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer
  ];

  home.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };
}