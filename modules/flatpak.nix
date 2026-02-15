{ lib, ... }: {
  services.flatpak = {
    enable = true;
    
    uninstallUnmanaged = false;

    packages = [
      "org.vinegarhq.Sober"
    ];
  };
}