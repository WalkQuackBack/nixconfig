{ inputs, stateVersion, pkgs, ... }: {
    imports = [
        ./boot.nix
        ./packages.nix
    ];

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Canada/Mountain";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_CA.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_CA.UTF-8";
        LC_IDENTIFICATION = "en_CA.UTF-8";
        LC_MEASUREMENT = "en_CA.UTF-8";
        LC_MONETARY = "en_CA.UTF-8";
        LC_NAME = "en_CA.UTF-8";
        LC_NUMERIC = "en_CA.UTF-8";
        LC_PAPER = "en_CA.UTF-8";
        LC_TELEPHONE = "en_CA.UTF-8";
        LC_TIME = "en_CA.UTF-8";
    };

    i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.addons = with pkgs; [
            fcitx5-mozc
            fcitx5-gtk
        ];
    };

    # Services

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.avahi.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;

        raopOpenFirewall = true;

        extraConfig.pipewire = {
            "10-airplay" = {
            "context.modules" = [
                {
                    name = "libpipewire-module-raop-discover";
                    args = {
                      "raop.latency.ms" = 800;
                    };
                }
                ];
            };
        };
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Enable flakes and nix command
    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = stateVersion; # Did you read the comment?
}
