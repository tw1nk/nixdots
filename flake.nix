{
  description = "calles's dotfiles";

  # inputs are other flakes you use within your own flake, dependencies
  # if you will
  inputs = {
    # unstable has the 'freshest' packages you will find, even the AUR
    # doesn't do as good as this, and it's all precompiled.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    flake-utils.url = "github:numtide/flake-utils";

    nypkgs.url = "github:yunfachi/nypkgs";
    nypkgs.inputs.nixpkgs.follows = "nixpkgs";
  };

  # In this context, outputs are mostly about getting home-manager what it
  # needs since it will be the one using the flake
  outputs = { 
    self,
    nixpkgs, 
    home-manager,
    nypkgs,
    flake-utils,
    ... 
  } @ inputs: let 
  
  outputs = self;

  user = import ./user.nix;
 
  in {
    
      homeConfigurations = {
        inherit user;
        
        "${user.name}" = home-manager.lib.homeManagerConfiguration {
          # darwin is the macOS kernel and aarch64 means ARM, i.e. apple silicon
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [ ./home.nix ];
          extraSpecialArgs = { 
            inherit user;
            ylib = nypkgs.lib.aarch64-darwin;
          };
        };
    };
  };
}