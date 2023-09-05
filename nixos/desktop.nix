{ config, lib, ... }:
lib.mkIf (config.networking.hostName == "desktop") {
  # Enable swap on luks
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".device = "/dev/disk/by-uuid/c9eb19e3-05fa-4057-a251-60d49d38de4c";
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".keyFile = "/crypto_keyfile.bin";

  # jellyfin and homeassistant ports
  # networking.firewall.allowedTCPPorts = [ 53 8096 8920 8123 43177 ];
  # networking.firewall.allowedUDPPorts = [ 53 7359 1900 43177 ];
  networking.firewall.allowedTCPPorts = [ 53 80 443 8123 ];
  networking.firewall.allowedUDPPorts = [ 53 80 443 8123 ];

  # home assistant vm bride
  # networking.bridges = {
  #   "br0" = {
  #     interfaces = [ "wlo1" ];
  #   };
  # };

  # networking.interfaces.enp34s0.useDHCP = true;
  # networking.interfaces.br0.useDHCP = true;


  fileSystems."/data" =
    {
      device = "/dev/disk/by-label/ssd1tb";
      fsType = "ext4";
    };

  fileSystems."/bigdata" =
  {
    device = "/dev/disk/by-label/hdd12tb";
    fsType = "ext4";
  };
  # services.k3s.enable = true; 
}
