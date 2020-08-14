{ config, lib, pkgs, ... }:
let
  # https://github.com/unix121/i3wm-themer/blob/master/themes/001.json
  color_bg = "#1E272B";
  color_txt = "#EAD49B";

  nixpkgs-unstable = import sources.nixpkgs-unstable { config.allowUnfree = true; };

  sources = import ../../nix/sources.nix;

in
{
  xsession.enable = true;
  xsession.scriptPath = ".hm-xsession"; # Ref: https://discourse.nixos.org/t/opening-i3-from-home-manager-automatically/4849/8

  xsession.pointerCursor = {
    name = "capitaine-cursors-white";
    package = pkgs.capitaine-cursors;
    size = 16;
  };

  xsession.windowManager.i3 = import ./i3.nix { inherit lib nixpkgs-unstable pkgs; };

  # https://github.com/unix121/i3wm-themer/blob/master/themes/001.json
  xresources.properties = {
    "*background" = color_bg;
    "*foreground" = color_txt;
    "*cursorColor" = color_txt;

    "*color0" = color_bg;
    "*color1" = "#685742";
    "*color2" = "#9D6A47";
    "*color3" = "#B36D43";
    "*color4" = "#78824B";
    "*color5" = "#D99F57";
    "*color6" = "#C9A554";
    "*color7" = "#EAD49B";
    "*color8" = "#666666";
    "*color9" = "#685743";
    "*color10" = "#9D6A47";
    "*color11" = "#B36D43";
    "*color12" = "#78824B";
    "*color13" = "#D99F57";
    "*color14" = "#C9A554";
    "*color15" = color_txt;

  };
}
