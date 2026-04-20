{ config, pkgs, ... }: {
    imports = [
        ./packages/lutris.nix
    ];
    environment.systemPackages = with pkgs; [
        google-chrome
        ungoogled-chromium
        mullvad-browser
        bitwarden-desktop
        vscode

        nodejs_24
        deno
        pnpm

        prismlauncher
    ];
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        maple-mono.variable
        maple-mono.woff2
        inter
    ];
    programs.steam = {
        enable = true; # Master switch, already covered in installation
        remotePlay.openFirewall = true;  # For Steam Remote Play
        dedicatedServer.openFirewall = true; # For Source Dedicated Server hosting
        # Other general flags if available can be set here.
    };
    services.flatpak.enable = true;
    services.mullvad-vpn = {
        enable = true;
        package = pkgs.mullvad-vpn;
    };
}
