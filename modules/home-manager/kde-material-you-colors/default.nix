{ pkgs, lib, config, ... }:
let 
    configFile = ./config.conf;
in
{
    home.packages = with pkgs; [
        python313Packages.kde-material-you-colors
    ];
    home.file."${config.xdg.configHome}/kde-material-you-colors/config.conf" = {
        force = true;
        source = configFile;
    };
    systemd.user.services.kde-material-you-colors = {
        Install = {
            WantedBy = [ "graphical-session.target" ];
        };
            
        Service = {
            Type = "simple";
            ExecStart = "${lib.getExe pkgs.python313Packages.kde-material-you-colors}";
            Restart = "on-failure";
        };
    };
}