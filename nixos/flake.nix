{
  description = "NixOS configurations";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

  # self is needed because of flake things (somehow?)
  # nixos docs fucking suck
  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # Specify the system explicitly
        modules = [
          ./common.nix # Shared configuration
          ./device_laptop.nix # Laptop-specific configuration
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common.nix # Shared configuration
          ./device_desktop.nix # Desktop-specific configuration
        ];
      };

      k3s-dev = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./device_server_k3s-dev.nix ];
      };
    };
  };
}
