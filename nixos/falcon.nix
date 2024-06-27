{ pkgs, ... }:
let
  falcon = pkgs.callPackage ./falcon-default.nix { };
  startPreScript = pkgs.writeScript "init-falcon" ''
    #! ${pkgs.bash}/bin/sh
    /run/current-system/sw/bin/mkdir -p /opt/CrowdStrike
    ln -sf ${falcon}/opt/CrowdStrike/* /opt/CrowdStrike
    if [ -z "$COMPANYID" ]; then
      echo "Error: COMPANYID environment variable is not set"
      exit 1
    fi
    ${falcon}/bin/fs-bash -c "${falcon}/opt/CrowdStrike/falconctl -s --cid=$COMPANYID"
  '';
in {
  systemd.services.falcon-sensor = {
    enable = true;
    description = "CrowdStrike Falcon Sensor";
    unitConfig.DefaultDependencies = false;
    after = [ "local-fs.target" ];
    conflicts = [ "shutdown.target" ];
    before = [ "sysinit.target" "shutdown.target" ];
    serviceConfig = {
      ExecStartPre = "${startPreScript}";
      ExecStart =
        ''${falcon}/bin/fs-bash -c "${falcon}/opt/CrowdStrike/falcond"'';
      Type = "forking";
      PIDFile = "/run/falcond.pid";
      Restart = "no";
      TimeoutStopSec = "60s";
      KillMode = "process";
      EnvironmentFile = "/etc/falcon-sensor.env";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
