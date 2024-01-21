{ lib, ... }:
let
  machineID = builtins.readFile "/etc/machine-id";
  desktopMachineID = ''
    9c2d20d6761e4395861207cef10569e4
  '';

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

  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 5000; # Use 2048MiB memory.
      cores = 6;
    };
  };

  services.k3s.enable = true;

  fileSystems."/bigdata" = {
    device = "/dev/disk/by-label/hdd12tb";
    fsType = "ext4";
  };

  services.netdata.enable = true;
  # services.nfs.server.enable = true;
  # services.nfs.server.exports = ''
  #   /bigdata/media/           127.0.0.1/24(rw,insecure,no_subtree_check)
  #   /data/kubernetes/         127.0.0.1/24(rw,insecure,no_subtree_check)
  # '';
  systemd.tmpfiles.rules =
    [ "L+ /usr/local/bin - - - - /run/current-system/sw/bin/" ];

  services.openiscsi = {
    enable = true;
    name = "kubernetes";
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
  };

  system.stateVersion = "22.11";
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };
}
