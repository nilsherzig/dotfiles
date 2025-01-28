# /etc/nixos/flake.nix
{
  description = "laptop";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    ghostty = { url = "github:ghostty-org/ghostty"; };
    # zen-browser = { url = "github:0xc000022070/zen-browser-flake"; };
  };

  # outputs = { self, nixpkgs, ghostty }: {
    outputs = { self, nixpkgs, ghostty }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = builtins.currentSystem;
        modules = [
          ./configuration.nix
          {
            environment.systemPackages = [
              ghostty.packages.${builtins.currentSystem}.default
              # zen-browser.packages.${builtins.currentSystem}.default
            ];
          }
        ];
      };
    };
  };
}
