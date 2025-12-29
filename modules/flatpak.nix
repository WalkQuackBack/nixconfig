{ lib, ... }: {
  services.flatpak = {
    enable = true;
    
    uninstallUnmanaged = true;

    packages = [
      "org.vinegarhq.Sober"
    ];
  };
}