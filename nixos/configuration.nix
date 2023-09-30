{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix # Include the results of the hardware scan.
    ./desktop.nix
    ./laptop.nix
    ./hostname.nix
    ./home.nix
    ./packages.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = "1048576"; # 128 times the default 8192
    "fs.inotify.max_user_instances" = "8192";
  };

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
    options hid_apple swap_opt_cmd=1
  '';

  boot.kernelParams = [ "amd_iommu=on" ];

  # virtual 
  virtualisation.docker.enable = true;

  # virtualisation.docker.extraOptions = ''
  # --default-ulimit nofile=65535:65535
  # '';
  console.keyMap = "de";
  # Setup keyfile
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable swap on luks
  # boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".device = "/dev/disk/by-uuid/c9eb19e3-05fa-4057-a251-60d49d38de4c";
  # boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".keyFile = "/crypto_keyfile.bin";

  # networking.hostName = "desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.enableIPv6 = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  systemd.network.wait-online.timeout = 0;
  boot.initrd.systemd.network.wait-online.timeout = 0;
  systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

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

  services.udev.packages = [ pkgs.dolphinEmu ];

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.

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

  services = {
    syncthing = {
      enable = true;
      user = "nils";
      dataDir = "/home/nils/syncthing"; # Default folder for new synced folders
      configDir =
        "/home/nils/.config/syncthing"; # Folder for Syncthing's settings and keys
      overrideDevices =
        true; # overrides any devices added or deleted through the WebUI
      overrideFolders =
        true; # overrides any folders added or deleted through the WebUI
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
      };
      folders = {
        "Uni" = {
          path = "/home/nils/uni";
          devices = [ "desktop" "laptop" ];
        };
        "Kubernetes" = {
          path = "/home/nils/kubernetes";
          devices = [ "desktop" "laptop" ];
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

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  virtualisation.libvirtd.enable = true;

  programs.wireshark.enable = true;

  users.users.nils = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "nils";
    extraGroups = [
      "keyd"
      "networkmanager"
      "wheel"
      "docker"
      "dialout"
      "libvirtd"
      "wireshark"
      "adbusers"
    ];
    hashedPassword =
      "$y$j9T$tXZKvVUEHqVuubteVIh8n0$A0gzkC.T8b6D2ouV6pUnYy2cH5JkcvSKKcjH83Y2vA9";
    home = "/home/nils/";
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = false;
    ohMyZsh.enable = true;
    ohMyZsh.plugins = [ "git" "fzf" "zoxide" ];
    syntaxHighlighting.enable = true;
    shellAliases = {
      ip = "ip --color=always"; # ip show colors
      rclone = "rclone -P"; # always show rclone progress
      ssh = "TERM=xterm ssh"; # because of kitty
      k = "kubectl";
      update = "sudo nixos-rebuild switch";
      wifi =
        "nmcli dev wifi connect $(nmcli dev wifi rescan && nmcli dev wifi list | fzf | awk '{print $2}')";
      pixelbuds =
        "bluetoothctl info | grep Battery | awk '{print $4}' | sed -E 's/(//; s/)//'";
      lg = "lazygit";
      k9s = "k9s --logoless";
      upload = "~/dotfiles/scripts/upload.sh";
      vi = "nvim";
      b = "broot";
    };
    # promptInit = ''
    #   # autoload - U promptinit; promptinit
    #   # prompt pure
    #   source /etc/zshrc
    # '';

    interactiveShellInit = ''
      # source ${pkgs.grml-zsh-config}/etc/zsh/zshrc
      # zstyle ':prompt:grml:left:items:user' pre '%F{blue}%B'
    '';
    promptInit =
      "source <(starship init zsh --print-full-init)"; # otherwise it'll override the grml prompt

    shellInit = ''
      eval "$(direnv hook zsh)"
      export EDITOR=nvim
      export PATH=~/.npm-packages/bin:$PATH
      export NODE_PATH=~/.npm-packages/lib/node_modules
    '';
  };

  programs.steam = { enable = true; };

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [ htop mullvad-vpn starship ];

  fonts.packages = with pkgs; [
    cantarell-fonts
    iosevka
    fira-code
    jetbrains-mono
    comic-mono
    nerdfonts
  ];

  xdg.mime.defaultApplications = {
    "text/html" = "google-chrome.desktop"; # joining the dark side
    "x-scheme-handler/about" = "google-chrome.desktop";
    "x-scheme-handler/http" = "google-chrome.desktop";
    "x-scheme-handler/https" = "google-chrome.desktop";
    "x-scheme-handler/unknown" = "google-chrome.desktop";
  };

  services.udisks2.enable = true;

  services.mullvad-vpn.enable = true;
  system.stateVersion = "22.11";

  system.autoUpgrade.enable = true;
  # system.autoUpgrade.allowReboot = false;
  services.tailscale.enable = true;
  services.passSecretService.enable = true;

  # services.emacs.enable = true;
  hardware.bluetooth.settings = { General = { Experimental = true; }; };
  services.flatpak.enable = false;
  programs.dconf.enable = true;
  programs.adb.enable = true;

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
    # PATH = [ "${XDG_BIN_HOME}" ];
  };
  nix.settings.auto-optimise-store = true;
  services.joycond.enable = true;

  services.keyd = {
    enable = true;
    keyboards."*".settings = {
      main = {
        # capslock = "layer(caps)";
        # rightalt = "layer(rightalt)";
        rightalt = "layer(altgr)";
        # capslock = "overload(caps, esc)";
        capslock = "overload(caps, macro(esc :))";
      };

      altgr = {
        "u" = "G-7";
        "i" = "G-8";
        "o" = "G-9";
        "p" = "G-0";
      };
      caps = {
        h = "left";
        j = "down";
        k = "up";
        l = "right";
      };
      # caps = {
      #   "j" = "kp4";
      #   "k" = "kp2";
      #   "l" = "kp6";
      #   "i" = "kp8";
      #   "f" = "leftmouse";
      #   "s" = "rightmouse";
      #   "d" = "middlemouse";
      # };
    };
  };
}
