{ config, pkgs-stable, ... }: {
    environment.systemPackages = with pkgs-stable; [
        (lutris.override {
            extraPkgs = pkgs-stable: [
                wineWow64Packages.waylandFull
                winetricks
                vulkan-tools
                xterm
            ];
        })
    ];
}
