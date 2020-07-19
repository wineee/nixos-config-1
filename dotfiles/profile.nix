{ pkgs }:

{
  path = [ "$HOME/bin" ];

  aliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";

    c = "xclip -selection clipboard";

    cdn = "cd ~/nixos-config";
    cdc = "cd ~/code";
    cdt = "cd ~/code/tenx";

    da = "direnv allow";

    freetapbeer = "nmcli c up 'Free Tap Beer'";

    g = "git";

    # TODO: Move these to git aliases
    ga = "git add -p";
    gaa = "git add --all";
    gaf = "git add -N";
    gc = "git checkout";
    gca = "git commit --amend";
    gd = "git diff";
    gf = "git fetch --prune";
    gfo = "git fetch origin master:master";
    gl = "git log";
    gm = "git checkout master";
    gp = "git pull --prune";
    gpf = "git push --force-with-lease";
    gpn = "git push -u origin HEAD";
    gr = "git rebase";
    gs = "git status";

    halt = "shutdown now";

    headphones = ''
      echo -e 'power on\nquit' | bluetoothctl;
      and sleep 2;
      and echo -e 'connect 70:26:05:DA:27:A4\nquit' | bluetoothctl;
      and sleep 5;
      and pactl set-default-sink "bluez_sink.70_26_05_DA_27_A4.a2dp_sink";
    '';

    k = "kubectl";

    laptop = ''
      echo -e 'power off\nquit' | bluetoothctl;
      pactl set-default-sink "alsa_output.pci-0000_00_1f.3.analog-stereo"
    '';

    ll = "ls -l";

    logout = "i3-msg exit";

    myip = "dig @resolver1.opendns.com ANY myip.opendns.com +short";

    n = "sudo nixos-rebuild switch";

    nl = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";

    ngc = "sudo nix-env --delete-generations 30d --profile /nix/var/nix/profiles/system";

    p = "pactl upload-sample ~/Music/Own\\ Speech/IckbinArschratte.WAV ratte; and pactl play-sample ratte";

    # Print timestamp along with cmd output
    # Example: cmd | ts
    ts = "gawk '{ print strftime(\"[%Y-%m-%d %H:%M:%S]\"), $0 }'";

    watch-lorri = "journalctl --user -eu lorri -f";

    x = "exit";
  };
}
