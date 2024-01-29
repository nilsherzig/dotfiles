{ ... }: {
  networking.hostName = "laptop";
  # networking.extraHosts = ''
  #   172.18.0.1 iceportal.de
  # '';
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
  };
  networking.firewall.allowedTCPPorts = [ 8080 5173 ];
  networking.firewall.allowedUDPPorts = [ ];
  system.stateVersion = "23.11";

  programs.hyprland.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.mullvad-vpn.enable = true;

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
