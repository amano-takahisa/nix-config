{
  description = "Home Manager configuration of Jane Doe";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      applicationsDir = ./home-manager/applications;

      applications = map
        (name: applicationsDir + "/${name}/default.nix")
        (builtins.attrNames (builtins.readDir applicationsDir));
    in {
      homeConfigurations.takahisa = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home-manager/home.nix ]
	++ applications;

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
