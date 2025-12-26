{ config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        google-chrome
        microsoft-edge
        bitwarden-desktop
        vscode
    ];
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        inter
    ];
}
