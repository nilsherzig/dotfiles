{ ... }: {
  networking.hostName = "laptop";
  hardware.tuxedo-rs.enable = true;
  hardware.tuxedo-rs.tailor-gui.enable = true;
  hardware.tuxedo-keyboard.enable = true;
  # networking.extraHosts = ''
  #   172.18.0.1 iceportal.de
  # '';
  networking.firewall.allowedTCPPorts = [ 8080 5173 11434 ];
  networking.firewall.allowedUDPPorts = [ ];
  system.stateVersion = "23.11";
}
