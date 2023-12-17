{ ... }: {
  services = {
    syncthing = {
      enable = true;
      user = "nils";
      dataDir = "/home/nils/syncthing";
      configDir = "/home/nils/.config/syncthing";
      overrideDevices = true;
      overrideFolders = true;
      settings = {
        devices = {
          "desktop" = {
            id =
              "5MJIIGE-3O76BES-QNBNMC7-KJ2HGYP-KTEULD2-TTMETEW-JGT3GTW-BYDN6QE";
          };
          "laptop" = {
            id =
              "CYGD4VS-FGDQ7KZ-TOKZNDS-LPE4MNB-3VCKOEW-ICA3BDG-PZBAF6R-2FDR7QK";
          };
          "pixel" = {
            id =
              "OLD6HI2-4TEWRD3-JPJVY75-EZ3AJVS-PYD6FSP-LC7JX44-4IKY5YW-RU522AU";
          };
          "server" = {
            id =
              "GHMTDD2-ZU3EQFO-RRNOY3I-FDIEYUG-WJRHVXC-TNF5CNH-Q6XE2TL-R5YOTAC";
          };
        };
        folders = {
          # "Documents" = {
          #   path = "/home/nils/Documents";
          #   devices = [ "desktop" "laptop" "server" ];
          #   versioning = {
          #     type = "trashcan";
          #     params.cleanoutDays = "1000";
          #   };
          # };
          # "dotfiles" = {
          #   path = "/home/nils/dotfiles";
          #   devices = [ "desktop" "laptop" "server" ];
          #   versioning = {
          #     type = "trashcan";
          #     params.cleanoutDays = "1000";
          #   };
          # };
          "Uni" = {
            path = "/home/nils/uni";
            devices = [ "desktop" "laptop" "server" ];
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "1000";
            };
          };
          "kubernetes" = {
            path = "/home/nils/kubernetes";
            devices = [ "desktop" "laptop" "server" ];
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "1000";
            };
          };
          "Obsidian" = {
            path = "/home/nils/Notes";
            devices = [ "desktop" "laptop" "pixel" "server" ];
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "1000";
            };
          };
          "Wallpaper" = {
            path = "/home/nils/Pictures/wallpaper";
            devices = [ "desktop" "laptop" "server" ];
          };
        };
      };
    };
  };
}
