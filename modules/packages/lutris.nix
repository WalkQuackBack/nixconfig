{ config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        (lutris.override {
            extraPkgs = pkgs: [
                wineWow64Packages.waylandFull
                winetricks
                vulkan-tools
                xterm
            ];
        })
    ];
}
