 {config, pkgs, lib, ...}:
lib.mkIf (config.networking.hostName == "desktop") {
  # Enable swap on luks
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".device = "/dev/disk/by-uuid/c9eb19e3-05fa-4057-a251-60d49d38de4c";
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".keyFile = "/crypto_keyfile.bin";

  fileSystems."/data" =
  {
    device = "/dev/disk/by-label/ssd1tb";
    fsType = "ext4";
  };
 }