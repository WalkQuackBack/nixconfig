{ config, pkgs, ... }: {
    imports = [
        ./packages/waydroid.nix
    ];
    environment.systemPackages = with pkgs; [
        google-chrome
        microsoft-edge
        mullvad-browser
        bitwarden-desktop
        vscode
    ];
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        inter
    ];
    programs.steam = {
        enable = true; # Master switch, already covered in installation
        remotePlay.openFirewall = true;  # For Steam Remote Play
        dedicatedServer.openFirewall = true; # For Source Dedicated Server hosting
        # Other general flags if available can be set here.
    };
}
