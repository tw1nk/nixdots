{ 
  pkgs,
  user,
  ylib,
  ... 
}:
{

    home = {
      stateVersion = "24.11";
      username = user.name;
      homeDirectory = user.homeDir;
      
      file.".config" = {
        source = ./configs/config;
        recursive = true;
      };
    };


    imports = ylib.umport {
      paths= [./modules/programs];
      recursive = true;
    };


    home.packages = with pkgs; [];

}