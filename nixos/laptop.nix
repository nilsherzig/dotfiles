{ pkgs, ... }: {
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
  networking.firewall.allowedTCPPorts = [ 8080 5173 11434 ];
  networking.firewall.allowedUDPPorts = [ ];
  system.stateVersion = "23.11";
}
