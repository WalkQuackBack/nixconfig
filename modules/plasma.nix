{ inputs, pkgs, ... }: {
    services = {
        desktopManager.plasma6.enable = true;

        displayManager.sddm.enable = true;
        displayManager.sddm.wayland.enable = true;
    };
    environment.systemPackages = with pkgs; [
        kdePackages.filelight
    ];
    environment.plasma6.excludePackages = with pkgs; [
        kdePackages.elisa
        kdePackages.okular
        kdePackages.kdepim-runtime
        kdePackages.kmahjongg
        kdePackages.kmines
        kdePackages.konversation
        kdePackages.kpat
        kdePackages.ksudoku
        kdePackages.ktorrent
        kdePackages.plasma-browser-integration
        kdePackages.kate
        kdePackages.khelpcenter
        kdePackages.baloo-widgets
        kdePackages.dolphin-plugins
        kdePackages.ffmpegthumbs
        kdePackages.krdp
        mpv
    ];
}
