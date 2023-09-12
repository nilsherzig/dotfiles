{ config, lib, ... }:
lib.mkIf (config.networking.hostName == "desktop") {
  # Enable swap on luks
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".device =
    "/dev/disk/by-uuid/c9eb19e3-05fa-4057-a251-60d49d38de4c";
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".keyFile =
    "/crypto_keyfile.bin";

  networking.firewall.allowedTCPPorts = [ 22 53 80 443 8123 ];
  networking.firewall.allowedUDPPorts = [ 22 53 80 443 8123 ];

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  users.users.nils.openssh.authorizedKeys.keyFiles =
    [ /home/nils/dotfiles/nilsherzig.keys ];

  fileSystems."/data" = {
    device = "/dev/disk/by-label/ssd1tb";
    fsType = "ext4";
  };

  fileSystems."/bigdata" = {
    device = "/dev/disk/by-label/hdd12tb";
    fsType = "ext4";
  };
}
