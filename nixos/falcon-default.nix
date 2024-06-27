{ stdenv, lib, dpkg, buildFHSUserEnv, ... }:

let
  pname = "falcon-sensor";
  version = "7.18.0-17106";
  arch = "amd64";
  src = /opt/CrowdStrike + "/${pname}_${version}_${arch}.deb";

  falcon-sensor = stdenv.mkDerivation {
    inherit version arch src;
    buildInputs = [ dpkg ];
    name = pname;
    sourceRoot = ".";

    unpackCmd = ''
      dpkg-deb -x "$src" .
    '';

    installPhase = ''
      cp -r ./ $out/
      realpath $out
    '';

    meta = with lib; {
      description = "Crowdstrike Falcon Sensor";
      homepage = "https://www.crowdstrike.com/";
      license = licenses.unfree;
      platforms = platforms.linux;
      maintainers = with maintainers; [ nilsherzig ];
    };
  };
in buildFHSUserEnv {
  name = "fs-bash";
  targetPkgs = pkgs: [ pkgs.libnl pkgs.openssl pkgs.zlib ];

  extraInstallCommands = ''
    ln -s ${falcon-sensor}/* $out/
  '';

  runScript = "bash";
}
