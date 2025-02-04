{ ... }: {
  networking.hostName = "desktop";
  networking = {
    firewall = {
      enable = false;
    };
  };
  system.stateVersion = "23.11";

  services = {
    mullvad-vpn.enable = true;
  };
}
