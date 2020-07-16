{ pkgs, ... }:

let

  sources = import ../nix/sources.nix;

  nixpkgs-unstable = import sources.nixpkgs-unstable { config.allowUnfree = true; };

  #torguard = pkgs.callPackage ./torguard {};

  # TODO: Move whatever we can to home manager modules
  packages =
    [
      pkgs.arandr
      pkgs.asciinema
      pkgs.bind # Provides dig
      pkgs.binutils
      pkgs.bluez
      pkgs.bluez-tools
      pkgs.brave
      pkgs.compton
      pkgs.dconf
      pkgs.deluge
      pkgs.duplicati
      pkgs.feh
      pkgs.file
      pkgs.fortune
      pkgs.i3status-rust
      pkgs.jq
      pkgs.killall
      pkgs.ksshaskpass
      pkgs.lm_sensors
      pkgs.megacmd
      pkgs.ncdu
      pkgs.neofetch
      pkgs.niv
      pkgs.patchelf
      pkgs.pavucontrol
      pkgs.playerctl
      pkgs.pup
      pkgs.ripgrep
      pkgs.roboto
      nixpkgs-unstable.signal-desktop
      pkgs.slack
      pkgs.spideroak
      nixpkgs-unstable.spotify
      pkgs.terminator
      pkgs.unzip
      pkgs.variety
      pkgs.vlc
      pkgs.vnstat # Network Traffic Monitor
      pkgs.wget
      pkgs.whois
      pkgs.xclip
      pkgs.yq
    ];

in

packages
