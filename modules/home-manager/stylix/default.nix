{ pkgs, ... }:
{
  stylix = {
    targets = {
      alacritty = {
        enable = true;
        colors.enable = false;
      };

      blender = {
        enable = true;
        colors.enable = false;
      };

      nixcord = {
        enable = true;
        colors.enable = false;
      };

      noctalia-shell = {
        enable = true;
        colors.enable = false;
        opacity.enable = false;
      };

      gnome = {
        enable = true;
        colors.enable = false;
      };

      vscode = {
        enable = true;
        colors.enable = false;
      };

      gtk = {
        enable = true;
        colors.enable = false;
      };
    };
  };
}