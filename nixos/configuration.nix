{ config, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix  # Include the results of the hardware scan.
      ./desktop.nix
      ./laptop.nix
      ./hostname.nix
      ./home.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # virtual 
  virtualisation.docker.enable = true; 

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  # boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".device = "/dev/disk/by-uuid/c9eb19e3-05fa-4057-a251-60d49d38de4c";
  # boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".keyFile = "/crypto_keyfile.bin";

  # networking.hostName = "desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.enableIPv6 = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # because via and keyboard configs # doesnt work rn 
  # the via and vial packages already do these in their install scripts, idk why they dont work
  # services.udev.extraRules = ''
  # KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  # KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  # '';

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # security.polkit.enable = true;
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  users.mutableUsers = false;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];

  services = {
    syncthing = {
        enable = true;
        user = "nils";
        dataDir = "/home/nils/syncthing";    # Default folder for new synced folders
        configDir = "/home/nils/.config/syncthing";   # Folder for Syncthing's settings and keys
        overrideDevices = true;     # overrides any devices added or deleted through the WebUI
        overrideFolders = true;     # overrides any folders added or deleted through the WebUI
        devices = {
          "desktop" = { id = "5MJIIGE-3O76BES-QNBNMC7-KJ2HGYP-KTEULD2-TTMETEW-JGT3GTW-BYDN6QE"; };
        };
        folders = {
          "Wallpaper" = {        # Name of folder in Syncthing, also the folder ID
            path = "/home/nils/Pictures/wallpaper";    # Which folder to add to Syncthing
            devices = [ "desktop" ];      # Which devices to share the folder with
          };
      };
    };
  };


  users.users.nils = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "nils";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    hashedPassword = "$y$j9T$tXZKvVUEHqVuubteVIh8n0$A0gzkC.T8b6D2ouV6pUnYy2cH5JkcvSKKcjH83Y2vA9";
    home = "/home/nils/";
    packages = with pkgs; [
      # internet
      rclone
      
      rsync
      syncthing
      firefox 
      google-chrome
      qbittorrent
      # notes
      obsidian
      # code / terminal
      du-dust
      zoxide
      git
      neovim
      vscode
      fzf
      ripgrep
      kitty
      zsh-syntax-highlighting
      xdg-desktop-portal-hyprland
      xdg-utils
      # atuin
      # container
      docker
      docker-compose
      #chat
      whatsapp-for-linux
      discord
      signal-desktop
      #games
      steam
      # prismlauncher-qt5
      wine
      bottles
      #mail 
      evolution
      protonmail-bridge
      #theme
      gradience
      adw-gtk3
      lxappearance
      # hardware / stats
      via       # somehow doesnt work, appimage in repo works on arch tho
      netdata
      radeontop
      liquidctl
      lm_sensors
      openrgb
      # video 
      jellyfin-media-player
      celluloid
      kodi-wayland
      mpv
      yt-dlp
      # images
      gimp
      feh
      # gnome shell 
      gnome.gnome-tweaks
      gnome-extension-manager
      gnomeExtensions.blur-my-shell
      gnomeExtensions.mullvad-indicator
      gnomeExtensions.tray-icons-reloaded
      # misc
      wtype # does not work on gnome
      ydotool
      wl-clipboard
      libqalculate

      # desktop things / using gnome in this case
      # polkit_gnome
      # polkit
      gnome.nautilus
      gnome.sushi
      # udisks # gnome disks backend
      gnome.gnome-disk-utility
      gnome.gnome-font-viewer
      gnome.eog
      gnome.simple-scan
      gnome.adwaita-icon-theme
      # gnome.gnome-control-center

      # libs
      imlib2Full

      # window manager tools
      wofi
      gammastep
      swaybg
      pavucontrol
      brightnessctl
      libnotify
      # screenshot stack lel
      grim
      slurp  
      swappy
    ];
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    ohMyZsh.enable = true;
    ohMyZsh.plugins = [ "git" "zoxide" "vi-mode" "fzf"];
    ohMyZsh.theme = "linuxonly";
    syntaxHighlighting.enable = true;
    shellAliases = {
      ip="ip --color=always"; # ip show colors 
      cd="z";                 # use zoxide as cd
      rclone="rclone -P";     # always show rclone progress
    };
  };


  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; 
    # dedicatedServer.openFirewall = true; 
  };


  programs.hyprland.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    htop
    neovim 
    mullvad-vpn
  ];

  fonts.fonts = with pkgs; [
    iosevka
    cantarell-fonts
  ];

  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
  };

  services.udisks2.enable = true;
  services.netdata.enable = true;
  services.mullvad-vpn.enable = true; 
  system.stateVersion = "22.11"; # Did you read the comment? # na i didnt, going to change this anyways

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  # todos:
  # curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash

  # environment.sessionVariables = rec {
  #   # Not officially in the specification
  #   XDG_BIN_HOME    = "$HOME/.local/bin";
  #   DOTFILE_SCRIPTS    = "$HOME/Documents/dotfiles/scripts";
  #   PATH = [ 
  #     "${XDG_BIN_HOME}"
  #     "${DOTFILE_SCRIPTS}"
  #   ];
  # };
  # systemd = {
  #   user.services.polkit-gnome-authentication-agent-1 = {
  #     description = "polkit-gnome-authentication-agent-1";
  #     wantedBy = [ "graphical-session.target" ];
  #     wants = [ "graphical-session.target" ];
  #     after = [ "graphical-session.target" ];
  #     serviceConfig = {
  #         Type = "simple";
  #         ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #         Restart = "on-failure";
  #         RestartSec = 1;
  #         TimeoutStopSec = 10;
  #       };
  #   };
  # };
}