{ inputs, config, pkgs, ... }: {
  imports = [
    inputs.base16.homeManagerModule

    ../base.nix

    ./base.nix
    ./direnv.nix
    ./fzf.nix
    ./git.nix
    ./gpg.nix
    ./neovim.nix
    ./nnn.nix
    ./pass.nix
    ./tmux.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    distrobox
    dyff
    file
    ffsend
    hexdump
    ipcalc
    jq
    neofetch
    nix-diff
    nix-tree
    pinentry_curses
    qrencode
    rclone
    rsync
    sipcalc
    shellcheck
    sshfs
    sshpass  # Used for some sshuttle scripts
    sshuttle
    termdown
    tomb
    unzip
    wget
    zbar
  ];
}
