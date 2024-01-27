{ pkgs, ... }: {

  users.users.nils.packages = with pkgs; [ direnv zoxide eza git dig ];
}
