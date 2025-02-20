{
  description = "nixos home configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self, nixpkgs, nixpkgs-stable, nix-darwin, home-manager, nix-homebrew, ...
  }@inputs: 
  let
    inherit (self) outputs;
    
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-darwin"
    ];

    darwinModules = import ./modules/darwin;
    homeManagerModules = import ./modules/home-manager;

    legacyPackages = forAllSystems (
      system:
        import nixpkgs {
	  inherit system;
	  config.allowUnfree = true;
	});
    buildHomeManagerConfig =
      hostname: username:
      let	
	rootPath = "/Users/${username}/nixos/modules/home-manager";
        hostPath = "${rootPath}/hosts/${hostname}";
        sharedPath = "${rootPath}/shared";
      in {
        linkHostApp = config: app: config.lib.file.mkOutOfStoreSymlink "${hostPath}/${app}/config";
        linkSharedApp = config: app: config.lib.file.mkOutOfStoreSymlink "${sharedPath}/${app}/config";
      };
    createDarwin =
      hostname: username: fullname: email:
      (
        let
	  system = "aarch64-darwin";
	  vars = ((import (./. + "/hosts/shared/vars.nix")) system hostname username fullname email);

	  specialArgs = {
	    inherit
	      inputs
	      outputs
	      vars
	      ;
          };

	  modules = (builtins.attrValues darwinModules) ++ [
	    (./. + "/hosts/${hostname}")
	    home-manager.darwinModules.home-manager
	    {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.users."${username}" = homeManagerModules;
	      home-manager.extraSpecialArgs = specialArgs // {
	        homeManagerConfig = buildHomeManagerConfig hostname username;
	      };
	    }
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                user = username;
                enableRosetta = true;
                autoMigrate = true;
              };
            }
	  ];
	in
	nix-darwin.lib.darwinSystem { inherit specialArgs modules; }
      );
  in {
    inherit legacyPackages;

    overlays = import ./overlays { inherit inputs; };

    darwinConfigurations = {
      "Jans-M1Book-Pro" = createDarwin "Jans-M1Book-Pro" "jan" "Jan Koeppen" "jan@koeppen.name";
      "SIT-SMBP-D7130T" = createDarwin "SIT-SMBP-D7130T" "koeppenja" "Jan Koeppen" "jan.koeppen1@mail.schwarz";
    };
    darwinPackages = self.darwinConfigurations.${outputs.networking.hostName}.pkgs;
  };
}
