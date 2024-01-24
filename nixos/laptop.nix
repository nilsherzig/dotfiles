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

  programs.hyprland.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  systemd.services.customKeyd = {
    description = "custom keyd";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "/home/nils/Documents/keyd/bin/keyd";
      Restart = "always";
      User = "root";
    };
  };
}
