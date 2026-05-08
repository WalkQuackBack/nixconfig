{ inputs, pkgs, ... }: {
  imports = [
    inputs.niri-flake.nixosModules.niri
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  environment.systemPackages = with pkgs; [
    alacritty
    nautilus
    xwayland-satellite
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.logind.settings.Login.HandlePowerKey = "ignore";
  home-manager = {
    sharedModules = [
      inputs.noctalia.homeModules.default
      ./home-manager/niri/default.nix
      ./home-manager/noctalia/default.nix
    ];
  };
}
