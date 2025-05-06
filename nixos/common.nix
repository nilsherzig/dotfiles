{ pkgs, ... }: {
  imports = [
    ./packages_common.nix
    ./keyd.nix
    ./gnome-keyring.nix
    ./home.nix
    /etc/nixos/hardware-configuration.nix
  ];

  # services.envfs.enable = true;

  console.keyMap = "de";
  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    #   # WAYLAND_DISPLAY = "wayland-1";
    #   GTK_USE_PORTAL = "1";
    #   NIXOS_OZONE_WL = "1";
    #   GDK_BACKEND = "wayland,x11";
    #   QT_QPA_PLATFORM = "wayland;xcb";
    #   # XDG_BIN_HOME = "$HOME/.local/bin";
    #   # XDG_CACHE_HOME = "$HOME/.cache";
    #   # XDG_DATA_HOME = "$HOME/.local/share";
    #   # XDG_STATE_HOME = "$HOME/.local/state";
  };
  hardware = {
    opentabletdriver.enable = true;
    bluetooth = {
      enable = true;
      settings = { General = { Experimental = true; }; };
    };
    pulseaudio = { enable = false; };
  };
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  security.rtkit.enable = true;
  security.pam.u2f = {
    enable = false;
    # control = "required";
    # interactive = true;
    cue = true;
  };

  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
  };

  system.autoUpgrade.enable = true;
  time.timeZone = "Europe/Berlin";

  virtualisation = {
    docker = { enable = true; };
    libvirtd.enable = true;
  };

  boot = {
    extraModprobeConfig = ''
      options hid_apple fnmode=1
      options hid_apple swap_opt_cmd=1
    '';
    # initrd.systemd.network.wait-online.timeout = 0;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    tmp.cleanOnBoot = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  networking = {
    enableIPv6 = false;
    networkmanager.enable = true;
  };

  systemd = {
    # timers."rclone-sync" = {
    #   wantedBy = [ "timers.target" ];
    #   timerConfig = {
    #     OnBootSec = "5m";
    #     OnUnitActiveSec = "5m";
    #     Unit = "rclone-sync";
    #   };
    # };

    # services = {
    #   printing.enable = true;
    #   "rclone-sync" = {
    #     script = ''
    #       set -eu
    #       ${pkgs.rclone}/bin/rclone sync '/home/nils/Notes/' protondrive:notes/
    #       ${pkgs.rclone}/bin/rclone sync '/home/nils/Documents/hochschule/' protondrive:hochschule/
    #     '';
    #     serviceConfig = {
    #       Type = "oneshot";
    #       User = "nils";
    #     };
    #   };
    # };

    # network.wait-online = {
    #   enable = false;
    #   timeout = 0;
    # };
    # services.NetworkManager-wait-online.enable = false;
  };

  services = {
    cron = {
      enable = true;
      systemCronJobs = [
        "*/5 * * * * nils notify-send 'Posture Check' 'Remember to sit up straight!'"
        "*/20 * * * * nils notify-send 'Position Change' 'Time to switch between standing and sitting!'"
      ];
    };

    udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="4b42", ATTRS{idProduct}=="6071", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
    xserver.enable = true;
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;
    gnome.gnome-keyring.enable = true;

    passSecretService.enable = true;
    resolved.enable = false;
    udisks2.enable = true;
    xserver = {
      xkb = {
        layout = "de";
        variant = "nodeadkeys";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnsupportedSystem = true;
    };
  };

  users = {
    mutableUsers = true;
    users = {
      "nils.herzig" = {
        shell = pkgs.zsh;
        isNormalUser = true;
        description = "Nils Herzig";
        group = "users";
        extraGroups = [
          "keyd"
          "networkmanager"
          "wheel"
          "docker"
          "dialout"
          "libvirtd"
          "wireshark"
          "adbusers"
          "input"
          "plugdev"
        ];
        home = "/home/nils.herzig/";
      };

      nils = {
        shell = pkgs.zsh;
        isNormalUser = true;
        description = "nils";
        group = "users";
        extraGroups = [
          "keyd"
          "networkmanager"
          "wheel"
          "docker"
          "dialout"
          "libvirtd"
          "wireshark"
          "adbusers"
          "input"
          "plugdev"
        ];
        home = "/home/nils/";
      };
    };
  };

  programs = {
    nix-ld.enable = true;
    ladybird.enable = false;

    gnupg = {
      agent.enable = true;
      agent.pinentryPackage = pkgs.pinentry-gnome3;
    };

    hyprland.enable = true;

    dconf.enable = true;

    zsh = {
      enable = true;
      shellAliases = {
        cd = "z";
        ip = "ip --color=always";
        ssh = "TERM=xterm ssh";
        sshnostrict = "TERM=xterm ssh -o StrictHostKeyChecking=no";
        k = "kubectl";
        lg = "lazygit";
        vi = "nvim";
        vim = "nvim";
        blue = "bluetuith";
      };

      ohMyZsh = {
        enable = true;
        plugins = [ "git" "kubectx" "fzf" "zoxide" "safe-paste" ];
      };

      interactiveShellInit = ''
        source ${pkgs.grml-zsh-config}/etc/zsh/zshrc
        eval "$(direnv hook zsh)"

        export EDITOR=nvim;
        export NODE_PATH=~/.npm-packages/lib/node_modules
        export PATH=~/.npm-packages/bin:$PATH
      '';
    };
  };
}
