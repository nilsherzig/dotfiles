{ pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix # Include the results of the hardware scan.
      ./desktop.nix
      ./laptop.nix
      ./hostname.nix
      ./home.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.kernelParams = [
    "amd_iommu=on"
  ];

  # virtual 
  virtualisation.docker.enable = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];

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

  networking.firewall.allowedTCPPorts = [ 8000 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];

  services = {
      syncthing = {
          enable = true;
          user = "nils";
          dataDir = "/home/nils/syncthing"; # Default folder for new synced folders
              configDir = "/home/nils/.config/syncthing"; # Folder for Syncthing's settings and keys
              overrideDevices = true; # overrides any devices added or deleted through the WebUI
              overrideFolders = true; # overrides any folders added or deleted through the WebUI
              devices = {
                  "desktop" = { id = "5MJIIGE-3O76BES-QNBNMC7-KJ2HGYP-KTEULD2-TTMETEW-JGT3GTW-BYDN6QE"; };
                  "laptop" = { id = "B56X3FL-YZ564ID-APGMTTF-D6WERDK-RGYGZ2J-CYTCUMO-SBLRC5W-3VOCDA3"; };
                  "handy" = { id = "JVEVYPA-7YG7QWO-32G776N-AOYQQFN-OYSF7ZK-KSZW3BC-FOMMHPO-GDXHCA7"; };
              };
          folders = {
              "Documents" = {
                  path = "/home/nils/Documents";
                  devices = [ "desktop" "laptop" ];
              };
              "ZugMedien" = {
                  path = "/home/nils/Videos/Zug/";
                  devices = [ "desktop" "laptop" "handy" ];
              };
          };
      };
  };


  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  virtualisation.libvirtd.enable = true;

  users.users.nils = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "nils";
    extraGroups = [ "networkmanager" "wheel" "docker" "dialout" "libvirtd" "wireshark" ];
    hashedPassword = "$y$j9T$tXZKvVUEHqVuubteVIh8n0$A0gzkC.T8b6D2ouV6pUnYy2cH5JkcvSKKcjH83Y2vA9";
    home = "/home/nils/";
    packages = with pkgs; [
      virt-manager
      # language server
      nodePackages_latest.typescript-language-server
      typescript
      nodePackages_latest.vscode-langservers-extracted
      lua-language-server
      marksman
      # java-language-server
      jdt-language-server
      rust-analyzer
      nodePackages_latest.bash-language-server
      nodePackages_latest.pyright
      python311Packages.python-lsp-server
      clang-tools
      # other things
      # distrobox
      kubectl
      pciutils
      popeye
      # internet
      pandoc
      nixpkgs-fmt
      bluetuith
      rclone
      spaceship-prompt
      gnumake
      dig
      python311Packages.bpython
      ansible
      rsync
      texlive.combined.scheme-small
      nodePackages_latest.bash-language-server
      syncthing
      kubernetes-helm
      firefox
      helix
      nodejs
      # neovim
      luarocks
      lazygit
      nil
      nixpkgs-fmt
      radare2
      usbutils
      google-chrome
      qbittorrent
      ffmpeg
      python311
      # notes
      ltrace
      jdk17
      nil
      obsidian
      direnv
      # code / terminal
      du-dust
      screen
      zoxide
      git
      # neovim
      clang-tools
      unzip
      gcc
      vscode
      fzf
      ripgrep
      kitty
      lua-language-server
      zsh-syntax-highlighting
      gh
      pure-prompt
      xdg-desktop-portal-hyprland
      xdg-utils
      # atuin
      # container
      docker
      docker-compose
      evince
      cdrtools
      terraform
      terraform-ls
      #chat
      whatsapp-for-linux
      discord
      signal-desktop
      #games
      steam
      # prismlauncher-qt5
      k9s
      kubectx
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
      via # somehow doesnt work, appimage in repo works on arch tho
      radeontop
      liquidctl
      lm_sensors
      ranger
      openrgb
      # video 
      jellyfin-media-player
      celluloid
      kodi-wayland
      mpv
      yt-dlp
      gradle_7
      # images
      gimp
      lens
      feh
      speedtest-cli
      # gnome shell 
      # gnome.gnome-tweaks
      # gnome-extension-manager
      # gnomeExtensions.blur-my-shell
      # gnomeExtensions.mullvad-indicator
      # gnomeExtensions.tray-icons-reloaded
      obs-studio
      libwebp
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
      # opensnitch-ui
      wofi
      tree
      gammastep
      swaybg
      pavucontrol
      brightnessctl
      ghidra-bin
      cutter
      rizin
      wireshark
      distrobox
      libnotify
      go-tools
      # screenshot stack lel
      grim
      slurp
      swappy
      # vscode
      emacs
      fd

      go
      delve
      gopls
      gomodifytags
      gotests
      gore
      gotools
      shellcheck
      nodePackages_latest.stylelint
      html-tidy
      nodePackages.js-beautify
      prismlauncher
    ];
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    ohMyZsh.enable = true;
    ohMyZsh.plugins = [ "git" "fzf" "zoxide" ];
    syntaxHighlighting.enable = true;
    shellAliases = {
      code = "code --enable-features=UseOzonePlatform --ozone-platform=wayland";
      ip = "ip --color=always"; # ip show colors 
      rclone = "rclone -P"; # always show rclone progress
      ssh = "TERM=xterm ssh"; # because of kitty
      k = "kubectl"; 
      # nvim = "docker run -it --env UID=$UID --env GUI=$GID -v $HOME/.nvim-container/cache:/home/nvim/.local/share/nvim -v $HOME/.nvim-container/config:/home/nvim/.config/nvim -v $PWD:/home/nvim/workdir -v $HOME/.gitconfig:/home/nvim/.gitconfig -v $HOME/.ssh/id_rsa:/home/nvim/.ssh/id_rsa -v $HOME/.ssh/known_hosts:/home/nvim/.ssh/known_hosts nilsherzig/nvim-container nvim";
    };
    promptInit = ''
      autoload - U promptinit; promptinit
      prompt pure
    '';

    shellInit = ''
      eval "$(direnv hook zsh)"
      export EDITOR=nvim
    '';
  };


  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; 
    # dedicatedServer.openFirewall = true; 
  };


  programs.hyprland.enable = true;


  environment.systemPackages = with pkgs; [
    htop
    powertop
    # neovim
    mullvad-vpn
  ];

  fonts.fonts = with pkgs; [
    iosevka
    cantarell-fonts
    nerdfonts
  ];

  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
  };

  services.udisks2.enable = true;
  #services.netdata.enable = true; # broken rn 
  services.mullvad-vpn.enable = true;
  system.stateVersion = "22.11";

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  services.tailscale.enable = true; 
  services.passSecretService.enable = true;
  services.openssh = {
      enable = true;
      passwordAuthentication = false;
      kbdInteractiveAuthentication = false;
  };

    # services.emacs.enable = true;
}
