{ lib, ... }:
let
  machineID = builtins.readFile "/etc/machine-id";
  laptopMachineID = "e6d46d37f03f4ff69c8804620c2d80bd\n";

in lib.mkIf (machineID == laptopMachineID) {
   networking.hostName = "laptop";
  # Enable swap on luks
  boot.initrd.luks.devices."luks-f01a4a17-fb5d-4c97-81c4-4968d987c0d7".device =
    "/dev/disk/by-uuid/f01a4a17-fb5d-4c97-81c4-4968d987c0d7";
  boot.initrd.luks.devices."luks-f01a4a17-fb5d-4c97-81c4-4968d987c0d7".keyFile =
    "/crypto_keyfile.bin";

  networking.firewall.allowedTCPPorts = [ 8080 ];
  networking.firewall.allowedUDPPorts = [ ];
} 
