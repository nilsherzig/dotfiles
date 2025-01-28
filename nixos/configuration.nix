{ lib, ... }:
let
  machineID = builtins.readFile "/etc/machine-id";
  private = ''
    08420923fa5a478aad4b922dad12fc76
  '';
  work = ''
    be0f441f87964e42a3c4d5533cae8214
  '';
in {
  # nix = {
  #   package = pkgs.nixFlakes;
  #   extraOptions = ''
  #     experimental-features = nix-command flakes
  #   '';
  # };

  imports = [
    /etc/nixos/hardware-configuration.nix
    ./global-settings.nix
    ./gnome-keyring.nix
    ./home.nix
    ./nix-alien.nix
  ] ++ lib.optional (machineID == private) ./laptop-private.nix
    ++ lib.optional (machineID == private) ./keyd.nix
    ++ lib.optional (machineID == work) ./falcon.nix
    ++ lib.optional (machineID == private || machineID == work)
    ./laptop-packages.nix ++ lib.optional (machineID == work) ./laptop-work.nix;

}
