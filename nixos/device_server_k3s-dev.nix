{ ... }: {
  networking.hostName = "k3s-dev";

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 6443 ];
      allowedUDPPorts = [ ];
    };
  };
  system.stateVersion = "23.11";

  users = {
    mutableUsers = false;
    users = {
      nils = {
        isNormalUser = true;
        description = "nils";
        group = "users";
        extraGroups = [
          "wheel"
        ];
        home = "/home/nils/";
        openssh.authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJrjIYeYQvI96NnZ3QsEhLWTKUzOHkipto8bF6kMwMkz nils@desktop"
        ];
      };
    };
  };

  services = {
    k3s = {
        enable = true;
    };

    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        AllowUsers = "nils";
        PermitRootLogin = "no";
      };
    };
  };
}
