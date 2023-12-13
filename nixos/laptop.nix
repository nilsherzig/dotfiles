{ lib, ... }:
let
  machineID = builtins.readFile "/etc/machine-id";
  laptopMachineID = "2c2b13ee31dc4e37b74274aa5608c424\n";

in lib.mkIf (machineID == laptopMachineID) {
   networking.hostName = "laptop";
  # Enable swap on luks
  # boot.initrd.luks.devices."luks-f01a4a17-fb5d-4c97-81c4-4968d987c0d7".device = "/dev/disk/by-uuid/f01a4a17-fb5d-4c97-81c4-4968d987c0d7";
  # boot.initrd.luks.devices."luks-f01a4a17-fb5d-4c97-81c4-4968d987c0d7".keyFile = "/crypto_keyfile.bin";

  system.stateVersion = "23.11";
  networking.firewall.allowedTCPPorts = [ 8080 ];
  networking.firewall.allowedUDPPorts = [ ];
} 
