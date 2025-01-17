{ pkgs, ... }: {

  users.users.nils.packages = with pkgs; [
    dig
    direnv
    eza
    git
    htop
    liquidctl
    yuzuPackages.early-access
    zoxide
  ];
}
