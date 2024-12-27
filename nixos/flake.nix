# /etc/nixos/flake.nix
{
  description = "laptop";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    ghostty = { url = "github:ghostty-org/ghostty"; };
    zen-browser = { url = "github:0xc000022070/zen-browser-flake"; };
  };

  outputs = { self, nixpkgs, ghostty, zen-browser }: {
    nixosConfigurations = {
      yourHostNameGoesHere = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };
    };
  };
}

