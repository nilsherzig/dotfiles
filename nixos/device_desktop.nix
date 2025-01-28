{ ... }: {
  networking.hostName = "desktop";
  networking = {
    firewall = {
      enable = true;
    };
  };
  system.stateVersion = "23.11";

  services = {
    mullvad-vpn.enable = true;
  };
}
