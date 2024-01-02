{ lib, ... }:
let
  machineID = builtins.readFile "/etc/machine-id";
  laptopMachineID = ''
    2c2b13ee31dc4e37b74274aa5608c424
  '';

in lib.mkIf (machineID == laptopMachineID) {
  networking.hostName = "laptop";
  # networking.extraHosts = ''
  #   172.18.0.1 iceportal.de
  # '';
  networking.firewall.allowedTCPPorts = [ 8080 5173 ];
  networking.firewall.allowedUDPPorts = [ ];
  # hardware.tuxedo-rs = {
  #   enable = true;
  #   tailor-gui.enable = true;
  # };
  # hardware.tuxedo-keyboard.enable = true;
  system.stateVersion = "23.11";
}
