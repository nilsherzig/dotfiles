{ ... }: {
  networking.hostName = "laptop";
  # networking.extraHosts = ''
  #   172.18.0.1 iceportal.de
  # '';
  programs.dconf.enable = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
    # PATH = [ "${XDG_BIN_HOME}" ];
  };
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
