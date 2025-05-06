{ ... }: {
  networking.hostName = "desktop";
  networking = {
    firewall = {
      enable = false;
      allowedTCPPorts = [ 8080 8081 3000 2283 ];
      allowedUDPPorts = [ ];
    };
  };
  system.stateVersion = "23.11";

  services = { mullvad-vpn.enable = true; };
  programs.steam.enable = true;
}
