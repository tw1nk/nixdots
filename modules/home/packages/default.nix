{
  pkgs,
  ...
}: let
  # Package sets for different targets
  macos = import ./osx.nix {inherit pkgs;};
  globals = import ./globals.nix {inherit pkgs;};

in 
  globals ++ macos
