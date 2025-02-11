{
  config,
  user,
  ...
} : {
  programs.zsh.enable = true;
  
  programs.zsh.shellAliases = {
    homeswitch = "nix run github:nix-community/home-manager -- switch --flake ${user.homeDir}/repos/github.com/tw1nk/nixdots --show-trace";
  };

  #programs.zsh.initExtra = ''
  #  eval "$(starship init zsh)"
  #'';
}