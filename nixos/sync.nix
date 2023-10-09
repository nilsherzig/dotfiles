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
              "B56X3FL-YZ564ID-APGMTTF-D6WERDK-RGYGZ2J-CYTCUMO-SBLRC5W-3VOCDA3";
          };
          "handy" = {
            id =
              "JVEVYPA-7YG7QWO-32G776N-AOYQQFN-OYSF7ZK-KSZW3BC-FOMMHPO-GDXHCA7";
          };
          "server" = {
            id =
              "GHMTDD2-ZU3EQFO-RRNOY3I-FDIEYUG-WJRHVXC-TNF5CNH-Q6XE2TL-R5YOTAC";
          };
        };
        folders = {
          "Uni" = {
            path = "/home/nils/uni";
            devices = [ "desktop" "laptop" "server" ];
          };
          "Kubernetes" = {
            path = "/home/nils/kubernetes";
            devices = [ "desktop" "laptop" "server" ];
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "1000";
            };
          };
          "Wallpaper" = {
            path = "/home/nils/Pictures/wallpaper";
            devices = [ "desktop" "laptop" ];
          };
          "ZugMedien" = {
            path = "/home/nils/Videos/Zug/";
            devices = [ "desktop" "laptop" "handy" ];
          };
          "Obsidian" = {
            path = "/home/nils/Notes";
            devices = [ "desktop" "laptop" "handy" ];
          };
        };
      };
    };
  };
}
