{ config, lib, ... }:
lib.mkIf (config.networking.hostName == "laptop") {
  # Enable swap on luks
  boot.initrd.luks.devices."luks-f01a4a17-fb5d-4c97-81c4-4968d987c0d7".device = "/dev/disk/by-uuid/f01a4a17-fb5d-4c97-81c4-4968d987c0d7";
  boot.initrd.luks.devices."luks-f01a4a17-fb5d-4c97-81c4-4968d987c0d7".keyFile = "/crypto_keyfile.bin";
}
