{ ... }: {
  networking.hostName = "desktop";
  # Enable swap on luks
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".device =
    "/dev/disk/by-uuid/c9eb19e3-05fa-4057-a251-60d49d38de4c";
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".keyFile =
    "/crypto_keyfile.bin";

  # boot.initrd.kernelModules = [ "usb_storage" ];
  # boot.initrd.luks.devices = {
  #   luksroot = {
  #     device = "/dev/disk/by-uuid/c9eb19e3-05fa-4057-a251-60d49d38de4c";
  #     allowDiscards = true;
  #     keyFileSize = 4096;
  #     # pinning to /dev/disk/by-id/usbkey works
  #     keyFile = "/dev/sdc";
  #   };
  # };

  services.dnsmasq = {
    enable = true;
    # servers = [ "/nilsherzig.com/192.168.1.2" ];  # Replace with the IP address of 'desktop'
    extraConfig = ''
      address=/.nilsherzig.com/100.116.211.40
      interface=tailscale0
    '';
  };

  networking.firewall = {
    enable = false;
    allowedTCPPorts = [ 22 53 80 443 2049 8123 9090 8096 6443 30000 ];
    allowedUDPPorts = [ 22 53 80 443 8123 9090 8096 ];
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  users.users.nils.openssh.authorizedKeys.keyFiles =
    [ /home/nils/dotfiles/nilsherzig.keys ];

  fileSystems."/var/lib/rancher/k3s/storage" = {
    device = "/dev/disk/by-label/ssd1tb";
    fsType = "ext4";
  };

  # virtualisation.spiceUSBRedirection.enable = true;
  # virtualisation.vmVariant = {
  #   virtualisation = {
  #     memorySize = 5000; # Use 2048MiB memory.
  #     cores = 6;
  #   };
  # };

  services.k3s.enable = true;
  services.joycond.enable = true;
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0664", GROUP="plugdev"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0664", GROUP="users"
  '';

  # fileSystems."/bigdata" = {
  #   device = "/dev/disk/by-label/hdd12tb";
  #   fsType = "ext4";
  # };

  # services.netdata.enable = true;
  # services.nfs.server.enable = true;
  # services.nfs.server.exports = ''
  #   /bigdata/media/           127.0.0.1/24(rw,insecure,no_subtree_check)
  #   /data/kubernetes/         127.0.0.1/24(rw,insecure,no_subtree_check)
  # '';
  # systemd.tmpfiles.rules =
  #   [ "L+ /usr/local/bin - - - - /run/current-system/sw/bin/" ];

  # services.openiscsi = {
  #   enable = true;
  #   name = "kubernetes";
  # };

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall =
  #     true; # Open ports in the firewall for Steam Remote Play
  #   dedicatedServer.openFirewall =
  #     true; # Open ports in the firewall for Source Dedicated Server
  # };

  system.stateVersion = "22.11";
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

  # imports = [
  #   (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
  # ];

  # imports = [
  #   (fetchTarball
  #     "https://github.com/nix-community/nixos-vscode-server/tarball/master")
  # ];
  #
  # services.vscode-server.enable =
  #   true; # thats not the webserver, but the work at remote thing server

  # services.code-server = {
  #   enable = true;
  #   host = "desktop.taileb381.ts.net"; # tailscale
  #   port = 4444;
  #   extraEnvironment = {
  #     "TZ" = "Europe/Berlin";
  #     "EXTENSIONS_GALLERY" = ''
  #       {"serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery"}'';
  #   };
  # };
}
