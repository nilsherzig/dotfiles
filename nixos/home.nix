{ pkgs, ... }:
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [ (import "${home-manager}/nixos") ];

  home-manager.users."nils.herzig" = {
    home.stateVersion = "22.05";

    gtk = {
      enable = false;
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
    };

    home.sessionPath = [ "$HOME/.rd/bin" ];

    home.file."firefox-gnome-theme" = {
      target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
      source = (fetchTarball
        "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/master.tar.gz");
    };

    programs.firefox = {
      enable = true;
      policies = {
        ExtensionSettings = {
          # LeechBlock NG extension ID
          "leechblockng@proginosko.com" = {
            installation_mode = "force_installed";
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/leechblockng@proginosko.com/latest.xpi";
            # Prevents the user from disabling or removing the extension
            locked = true;
          };
        };
        # # Disable about:addons page to prevent access to extension management
        # BlockAboutAddons = true;
        # # Disable about:config to prevent advanced configuration changes
        # BlockAboutConfig = true;
      };
      profiles.default = {
        name = "Default";
        settings = {
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
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

  };

  home-manager.users.nils = {
    home.stateVersion = "22.11";

    gtk = {
      enable = true;
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
    };

    home.sessionPath = [ "$HOME/.rd/bin" ];

    home.file."firefox-gnome-theme" = {
      target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
      source = (fetchTarball
        "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/master.tar.gz");
    };

    programs.firefox = {
      enable = true;
      policies = {
        ExtensionSettings = {
          # LeechBlock NG extension ID
          "leechblockng@proginosko.com" = {
            installation_mode = "force_installed";
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/leechblockng@proginosko.com/latest.xpi";
            # Prevents the user from disabling or removing the extension
            locked = true;
          };
        };
        # # Disable about:addons page to prevent access to extension management
        # BlockAboutAddons = true;
        # # Disable about:config to prevent advanced configuration changes
        # BlockAboutConfig = true;
      };
      profiles.default = {
        name = "Default";
        settings = {
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
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
  };
}
