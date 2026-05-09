{
  description = "(Snow)flakes for fluffy winters";

  # https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-flake.html#flake-inputs
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    plasma-manager,
    niri-flake,
    noctalia,
    nixcord,
    nixos-hardware,
    ...
  }:
    let
      system = "x86_64-linux";
      stateVersion = "25.11";
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.ryuganhana = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit stateVersion pkgs-stable inputs;
        };
        modules = [
          ./consumers/ryuganhana/configuration.nix
          nixos-hardware.nixosModules.dell-xps-13-9310
          home-manager.nixosModules.default
          {
            home-manager = {
              extraSpecialArgs = {
                inherit stateVersion;
              };
              backupFileExtension = "old";
              sharedModules = [
                plasma-manager.homeModules.plasma-manager
                nixcord.homeModules.nixcord
              ];
              useGlobalPkgs = true;
              useUserPackages = true;
              users.user = ./modules/home-manager/home.nix;
            };
          }
        ];
    };
  };
}
