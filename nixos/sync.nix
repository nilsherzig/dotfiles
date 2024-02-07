{ ... }: {
  services = {
    syncthing = {
      enable = true;
      user = "nils";
      dataDir = "/home/nils/syncthing";
      configDir = "/home/nils/syncthing";
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
              "3RTXHDQ-BFYEPQZ-2XODEVN-C4CSHF6-E6MDV2V-MS7ENDE-RCUV3FC-HMWUVA7";
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
