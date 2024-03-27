{
    description = "Kartoza NixOS Flakes";

    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
      home-manager.url = "github:nix-community/home-manager/release-23.11";
    };

    outputs = { self, home-manager, nixpkgs }@inputs:
    let
      system = "x86_64-linux";
      specialArgs = inputs // { inherit system; };
      shared-modules = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    in {
        packages = forAllSystems
          (system:
            let
              pkgs = import nixpkgs {
                inherit system;
                overlays = [ self.overlays.default ];
                config.allowUnfree = true;
              };
            in
            {
              #inherit (pkgs) neovimConfigured;
              unsafe-bootstrap = pkgs.callPackage ./packages/setup-zfs-machine{ };
        });
        nixosConfigurations = {
          crest = nixpkgs.lib.nixosSystem {
            specialArgs = specialArgs;
	    system = system;
            modules = shared-modules ++ [ ./hosts/crest.nix ];
          };
          test = nixpkgs.lib.nixosSystem {
            specialArgs = specialArgs;
	    system = system;
            modules = shared-modules ++ [ ./hosts/test.nix ];
          };
        };
      };
}
