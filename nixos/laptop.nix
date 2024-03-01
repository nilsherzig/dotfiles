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
  services.power-profiles-daemon.enable = false;

  # i hate fan noise, while using my laptop on my lap 
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_SCALING_MIN_FREQ_ON_AC = "0";
      CPU_SCALING_MAX_FREQ_ON_AC = "1800000";

      CPU_SCALING_MIN_FREQ_ON_BAT = "0";
      CPU_SCALING_MAX_FREQ_ON_BAT = "1400000";

      CPU_BOOST_ON_AC = "1";
      CPU_BOOST_ON_BAT = "0";
    };
  };
}
