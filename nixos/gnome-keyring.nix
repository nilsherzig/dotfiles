# GNOME Keyring for storing/encrypting sycrets
# apps like vscode stores encrypted data using it
{ pkgs, ... }:

{
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  environment.systemPackages = [ pkgs.libsecret ]; # libsecret API
  environment.variables.XDG_RUNTIME_DIR =
    "/run/user/$UID"; # set the runtime directory
  programs.seahorse.enable = true; # enable the graphical frontend for managing
}
