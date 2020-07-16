{ config, lib, pkgs, ... }:

let 

  imports = [
    ./home/autorandr.nix
    ./home/i3.nix
    ./home/rofi.nix
    ./home/urxvt.nix
  ];

  fishrc = pkgs.callPackage ./dotfiles/fishrc.nix { inherit profile; };

  nixpkgs-unstable = import sources.nixpkgs-unstable { config.allowUnfree = true; };

  nur = import sources.NUR { inherit pkgs; };

  profile = pkgs.callPackage ./dotfiles/profile.nix {};

  scripts = pkgs.callPackage ./dotfiles/scripts.nix { inherit nixpkgs-unstable; };

  sources = import ./nix/sources.nix;

in

{

  home = {
    file = {
      # ~/bin
      # Declaratively configure Mega backups
      "bin/configure-mega-backup" = { text = scripts.configure-mega-backup; executable = true; };

      # Syncthing
      ".config/syncthing/config.xml".source = ./dotfiles/syncthing.xml;
      "code/.stignore".source = ./dotfiles/stignore_code;
      ".ssh/.stignore".source = ./dotfiles/stignore_ssh;

      # Syncthing tray
      ".config/syncthingtray.ini".source = ./dotfiles/syncthingtray.ini;

      # Variety
      ".config/variety/variety.conf".source = ./dotfiles/variety.conf;
    };

    sessionVariables = {
      PATH = "$HOME/bin:$PATH";
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "20.03";
  };

  inherit imports;

  gtk = {
    enable = true;
    font = {
      name = "Inconsolata 9";
      package = pkgs.google-fonts;
    };
    iconTheme = {
      name = "Pop";
      package = pkgs.pop-gtk-theme;
    };
    theme = {
      name = "Pop";
      package = pkgs.pop-gtk-theme;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs = {
    bat.enable = true;

    firefox = {
      enable = true;
      extensions = with nur.repos.rycee.firefox-addons; [
        lastpass-password-manager
        privacy-badger
      ];
      profiles = {
        main = {};
      };
    };

    fish = {
      enable = true;
      interactiveShellInit = fishrc.shellInit;
      functions = fishrc.functions;
      plugins = fishrc.plugins;
      shellAbbrs = profile.aliases;
    };

    git = {
      aliases = {
        c = "commit";
      };
      enable = true;
      ignores = [ ".idea" ]; # IntelliJ Idea dirs
      userEmail = "florian.peter@gmx.at";
      userName = "workflow";
    };

    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    htop.enable = true;

    neovim = {
      enable = true;

      extraConfig = ''
        set number
        set clipboard=unnamedplus
      '';

      plugins = with pkgs.vimPlugins; [
        vim-nix
      ];

      vimAlias = true;
    };

    ssh = {
      enable = true;
    };

  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  services = {
    flameshot.enable = true; 

    parcellite.enable = true;

    syncthing = {
      enable = true;
    };
  };

}
