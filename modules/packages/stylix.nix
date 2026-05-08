{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = false; 
    
    homeManagerIntegration.autoImport = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
    
    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "RoséPine";
      size = 32;
    };

    fonts = {
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

      sansSerif = {
        name = "Inter Variable";
        package = pkgs.inter;
      };

      monospace = {
        name = "Maple Mono";
        package = pkgs.maple-mono.variable;
      };

      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
    };
  };
  #   targets = {
  #     alacritty = {
  #       enable = true;
  #       colors.enable = false;
  #     };

  #     blender = {
  #       enable = true;
  #       colors.enable = false;
  #     };

  #     nixcord = {
  #       enable = true;
  #       colors.enable = false;
  #     };

  #     noctalia-shell = {
  #       enable = true;
  #       colors.enable = false;
  #       opacity.enable = false;
  #     };

  #     gnome = {
  #       enable = true;
  #       colors.enable = false;
  #     };

  #     vscode = {
  #       enable = true;
  #       colors.enable = false;
  #     };

  #     gtk = {
  #       enable = true;
  #       colors.enable = false;
  #     };
  #   };
  # };
  home-manager = {
    sharedModules = [
      ../home-manager/stylix/default.nix
    ];
  };
}