{ lib, ... }:
let
  machineID = builtins.readFile "/etc/machine-id";
  desktopMachineID = "9c2d20d6761e4395861207cef10569e4\n";

in lib.mkIf (machineID == desktopMachineID) {
  networking.hostName = "desktop";
  # Enable swap on luks
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".device =
    "/dev/disk/by-uuid/c9eb19e3-05fa-4057-a251-60d49d38de4c";
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".keyFile =
    "/crypto_keyfile.bin";

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 53 80 443 2049 8123 9090 8096 6443 ];
    allowedUDPPorts = [ 22 53 80 443 8123 9090 8096 ];
  };

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

  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 5000; # Use 2048MiB memory.
      cores = 6;
    };
  };

  # services.k3s.enable = false;

  # fileSystems."/bigdata" = {
  #   device = "/dev/disk/by-label/hdd12tb";
  #   fsType = "ext4";
  # };

  # services.nfs.server.enable = true;
  # services.nfs.server.exports = ''
  #   /bigdata/media/         127.0.0.1/24(rw,insecure,no_subtree_check)
  # '';
}
