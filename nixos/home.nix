{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.nils = {
    /* The home.stateVersion option does not have a default and must be set */
    # home.homeDirectory = "/home/nils";
    home.stateVersion = "22.11";

    home.file.".config/" = {
    # home.file."${config.xdg.configHome}" = {
        source = ../configs;
        recursive = true;
    };
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
  };
}