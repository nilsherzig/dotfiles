{ pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.nils = {
    home.stateVersion = "22.11";

    home.file.".config/" = {
      source = ../configs;
      recursive = true;
    };

    gtk = {
      enable = true;
      theme = {
        name = "adw-gtk3";
        package = pkgs.adw-gtk3;
      };
    };

    home.sessionPath = [
      "$HOME/.rd/bin"
    ];

    home.file."firefox-gnome-theme" = {
      target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
      source = (fetchTarball "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/master.tar.gz");
    };

    programs.firefox = {
      enable = true;
      profiles.default = {
        name = "Default";
        settings = {
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

          # For Firefox GNOME theme:
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.tabs.drawInTitlebar" = true;
          "svg.context-properties.content.enabled" = true;
        };
        userChrome = ''
          @import "firefox-gnome-theme/userChrome.css";
          @import "firefox-gnome-theme/theme/colors/dark.css"; 
        '';
      };
    };

    # nixpkgs.config.allowUnfree = true;
    # programs.vscode = {
    #   enable = true;
    #   extensions = with pkgs.vscode-extensions; [
    #     bbenoist.nix
    #     ms-python.python
    #     ms-azuretools.vscode-docker
    #     ms-vscode-remote.remote-ssh
    #     ms-vscode.cpptools            # because something about linking and determinism
    #     vscodevim.vim
    #     catppuccin.catppuccin-vsc
    #   ];
    # };
  };
}
