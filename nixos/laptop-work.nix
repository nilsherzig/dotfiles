{ ... }: {
  networking.hostName = "nherzig-t470s";
  networking = { firewall = { enable = true; }; };
  system.stateVersion = "23.11";
}
