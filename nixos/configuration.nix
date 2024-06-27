{ lib, ... }:
let
  machineID = builtins.readFile "/etc/machine-id";
  private = ''
    2c2b13ee31dc4e37b74274aa5608c424
  '';
  work = ''
    be0f441f87964e42a3c4d5533cae8214
  '';
in {
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
