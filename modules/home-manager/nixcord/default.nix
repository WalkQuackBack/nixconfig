{ ... }: 
let 
    theme-touchy = ./touchy.css;
in
{
    programs.nixcord = {
        enable = true;
        discord.enable = false;
        vesktop = {
            enable = true;
            settings = {
                discordBranch = "stable";
                minimizeToTray = true;
                disableMinSize = true;
                arRPC = true;
            };
        };
        config = {
            useQuickCss = true;
            plugins = {
                ClearURLs.enable = true;
                viewIcons.enable = true;
                vencordToolbox.enable = true;
                
                webKeybinds.enable = true;
                webScreenShareFixes.enable = true;
            };
            themes = {
                touchy = "${theme-touchy}";
            };
            enabledThemes = [
                "touchy.css"
            ];
        };
    };
}
