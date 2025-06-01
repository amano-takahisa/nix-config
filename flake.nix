{
  description = "Home Manager configuration of Takahisa";

  inputs = {
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
    getModules = category:
      let
        dir = "${applicationsDir}/${category}";
        appNames = builtins.attrNames (builtins.readDir dir);
      in
        map (name: dir + "/${name}/default.nix") appNames;

    cuiModules = getModules "cui";
    desktopModules = getModules "desktop";
  in {
    homeConfigurations = {
      letsnote = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager/home.nix ] ++ cuiModules ++ desktopModules;
        extraSpecialArgs = { profile = "letsnote"; };
      };

      wsl = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager/home.nix ] ++ cuiModules;
        extraSpecialArgs = { profile = "wsl"; };
      };
    };
  };
}
