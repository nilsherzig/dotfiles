{ ... }: {
  services = {
    syncthing = {
      enable = false;
      user = "nils";
      dataDir = "/home/nils/syncthing";
      configDir = "/home/nils/syncthing";
      overrideDevices = true;
      overrideFolders = true;
      settings = {
        devices = {
          "desktop" = {
            id =
              "WUCOXWM-MSUMNA2-EBANPQU-YVZJJ6K-OCE4M3K-TQH3OCG-KMU6H2I-RQ27IAS";
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
        options = { relaysEnabled = false; };
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
