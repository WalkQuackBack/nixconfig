{ config, pkgs, stateVersion, ... }:

{
  imports = [
    ./plasma.nix
  ];

  programs.git = {
    enable = true;
    # settings = {
    #   user = {
    #     name = "my_git_username";
    #     email = "my_git_username@gmail.com";
    #   };
    # };
  };

  home.stateVersion = stateVersion;
}