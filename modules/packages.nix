{ config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        google-chrome
        bitwarden-desktop
        vscode
        anki
    ];
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        inter
    ];
}
