{ ... }:

{
  services.xserver = {
    layout = "us,de,ua";
    xkbOptions = "grp:alts_toggle,eurosign:e,caps:escape_shifted_capslock,terminate:ctrl_alt_bksp";
  };
}
