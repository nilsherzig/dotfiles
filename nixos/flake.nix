{
  description = "NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    ghostty.url = "github:ghostty-org/ghostty";
  };

  # self is needed because of flake things (somehow?)
  # nixos docs fucking suck
  outputs = { self, nixpkgs, ghostty }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # Specify the system explicitly
        modules = [
          ./common.nix # Shared configuration
          ./device_laptop.nix # Laptop-specific configuration
          {
            environment.systemPackages =
              [ ghostty.packages.x86_64-linux.default ];
          }
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common.nix # Shared configuration
          ./device_desktop.nix # Desktop-specific configuration
          {
            environment.systemPackages =
              [ ghostty.packages.x86_64-linux.default ];
          }
        ];
      };

      k3s-dev = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./device_server_k3s-dev.nix ];
      };
    };
  };
}
