{
  description = "(Snow)flakes for fluffy winters";

  # https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-flake.html#flake-inputs
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, ... }:
    let
      system = "x86_64-linux";
      stateVersion = "25.11";
    in {
      nixosConfigurations.ryuganhana = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit stateVersion;
        };
        modules = [
          ./consumers/ryuganhana/configuration.nix
          home-manager.nixosModules.default
          {
            home-manager = {
              extraSpecialArgs = {
                inherit stateVersion;
              };
              backupFileExtension = "old";
              sharedModules = [ plasma-manager.homeModules.plasma-manager ];
              useGlobalPkgs = true;
              useUserPackages = true;
              users.user = ./modules/home-manager/home.nix;
            };
          }
        ];
    };
  };
}
