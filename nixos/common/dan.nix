{ config, pkgs, ... }: {
  users.users.dan = {
    isNormalUser = true;
    description = "Dan";
    extraGroups = [ "video" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+vdIusbvn2f1ME6riwqwU2sfaYeRLYLkV5LAKiFHmOLHFnHtYX1DZ5YWOIlmmGfUx5azzFfxlOYjRAMn3S4JxD3/pyfYUjUJdT2rtQx1TGpI5whV24f0vTDbCxgtpgzBEsdRiQmVY+YpFbfh5hpknmBM2HBGNXZbLJe7PmIXklRNNKl2PkbB7QsVu4OnLcBKGQVRi2hcqCEtYgt9WtxuenvnAt+VHt5Gm2/n/bPFIotBUNYMoIrVjagilltn5KbyXOPNeXKyhZ5P0bYx/ejiQeCVwF3DedGjWES/cjF5LpmtAfNX01i+j13Oj9t01QZauvPUrK4tqEsApOcUt4gCcU062U5LjAgNCXL++2WUpem6y5JxpO9QqIYovsFpXsLvBPUlOHhYdcgUjKTdG5eRh96IWgu2Xo5hBvYHY11Em35tiVa3UNI4ZUKiNzOMe2D5bQkbUOjribxjcUxzpEvP4x+WIpHv9ww+5qvSkaHnnEko5gOloMd3iduKsJi/VTAFIR0L+WJadlEKIIjSOqAQVCo+yyCR2shE7n5oHTriCJ+q2HBqz6d39JBT1u/jNw7TqC42nO+yZ1BXCC3tzJLYhGrPX8AdAXbYLd2BL/9bOYuUX2D8CyvZlM0ujevudsAwsSKeFbLVqJKZ2R+/kDniU/LbojdCZsQrRSo7A1Ml0xw== dan_nixon"
    ];
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableExtraSocket = true;
  };

  sops.secrets.ssh_config = let
    dan = config.users.users.dan;
  in {
    sopsFile = ./secrets.yaml;
    owner = dan.name;
    group = dan.group;
    path = "${dan.home}/.ssh/config";
  };
}
