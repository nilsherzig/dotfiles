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
        };
        folders = {
          "home" = {
            path = "/home/nils";
            devices = [ "desktop" "laptop" ];
            rescanIntervalS = 3600;
            fsWatcherEnabled = true;
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "1024";
            };
          };
        };
      };
    };
  };
}
