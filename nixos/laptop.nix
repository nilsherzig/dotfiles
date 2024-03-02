{ ... }: {
  networking.hostName = "laptop";
  hardware.tuxedo-rs.enable = true;
  hardware.tuxedo-rs.tailor-gui.enable = true;
  hardware.tuxedo-keyboard.enable = true;
  networking.firewall.allowedTCPPorts = [ 8080 5173 11434 ];
  networking.firewall.allowedUDPPorts = [ ];
  system.stateVersion = "23.11";
  services.power-profiles-daemon.enable = false;

  # i hate fan noise, while using my laptop on my lap 
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = "75";
      STOP_CHARGE_THRESH_BAT0 = "80";

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_SCALING_MIN_FREQ_ON_AC = "400000";
      CPU_SCALING_MAX_FREQ_ON_AC = "8000000"; # not actually

      # battery usage does not scale linar to frequency. 
      # cutting frequency in half reduces power usage by about two thirds
      CPU_SCALING_MIN_FREQ_ON_BAT = "400000";
      CPU_SCALING_MAX_FREQ_ON_BAT = "2000000";

      CPU_BOOST_ON_AC = "1";
      CPU_BOOST_ON_BAT = "0";
    };
  };
}
