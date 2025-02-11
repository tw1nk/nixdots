{
  config,
  pkgs,
  ...
} : {
  
  config.home.packages = with pkgs; [
    pkgs.ghq
  ];

  config.programs.zsh.sessionVariables.GHQ_ROOT = "~/repos";
}