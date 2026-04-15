{ config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        (lutris.override {
            extraPkgs = pkgs: [
                wineWowPackages.waylandFull
                winetricks
                vulkan-tools
                xterm
            ];
        })
    ];
}
