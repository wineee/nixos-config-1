{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    extraConfig = ''
      set number
      set clipboard=unnamedplus

      noremap ; l
      noremap l k
      noremap k j
      noremap j h

      noremap <C-w>; <C-w>l
      noremap <C-w>l <C-w>k
      noremap <C-w>k <C-w>j
      noremap <C-w>j <C-w>h

      set shell=/run/current-system/sw/bin/bash

      let mapleader = ' '

      colorscheme one
      let g:one_allow_italics = 1
      set background=dark
    '';

    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-one # Colorscheme
      vim-solidity
      vim-startify
    ];

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
