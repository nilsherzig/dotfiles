{ pkgs, lib, ... }:
let
  machineID = builtins.readFile "/etc/machine-id";
  laptopMachineID = ''
    2c2b13ee31dc4e37b74274aa5608c424
  '';
  desktopMachineID = ''
    9c2d20d6761e4395861207cef10569e4
  '';
in {
  imports = [ /etc/nixos/hardware-configuration.nix ./sync.nix ]
    ++ lib.optional (machineID == laptopMachineID) ./laptop.nix
    ++ lib.optional (machineID == laptopMachineID) ./keyd.nix
    ++ lib.optional (machineID == laptopMachineID) ./laptop-packages.nix
    ++ lib.optional (machineID == laptopMachineID) ./home.nix

    ++ lib.optional (machineID == desktopMachineID) ./desktop.nix
    ++ lib.optional (machineID == desktopMachineID) ./home.nix
    ++ lib.optional (machineID == desktopMachineID) ./server-packages.nix
    ++ lib.optional (machineID == desktopMachineID) ./laptop-packages.nix;

  console.keyMap = "de";
  hardware = {
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
  sound.enable = true;
  system.autoUpgrade.enable = true;
  time.timeZone = "Europe/Berlin";

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  boot = {
    kernel = {
      # sysctl = {
      #   "fs.inotify.max_user_watches" = "1048576"; # 128 times the default 8192
      #   "fs.inotify.max_user_instances" = "8192";
      #   "clearcpuid" = "514";
      # };
    };
    extraModprobeConfig = ''
      options hid_apple fnmode=2
      options hid_apple swap_opt_cmd=1
    '';
    # kernelParams =
    #   [ "amd_iommu=on" "clearcpuid=514" "vm.max_map_count=1000000" ];
    initrd.systemd.network.wait-online.timeout = 0;
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
    enableIPv6 = true;
    networkmanager.enable = true;
  };

  systemd = {
    services.customKeyd = {
      description = "custom keyd";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      serviceConfig = {
        ExecStart = "/home/nils/Documents/keyd/bin/keyd";
        Restart = "always";
        User = "root";
      };
    };

    network.wait-online.enable = false;
    network.wait-online.timeout = 0;
    services.NetworkManager-wait-online.enable = false;
  };

  # services.udev.extraRules = ''
  #   KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  #   KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  # '';

  services = {
    tailscale = {
      enable = true;
      extraUpFlags = [ "--ssh" ];
    };
    xserver.enable = true;
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;
    mullvad-vpn.enable = true;
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
    mutableUsers = false;
    users = {
      nils = {
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
          "input"
        ];
        hashedPassword =
          "$y$j9T$tXZKvVUEHqVuubteVIh8n0$A0gzkC.T8b6D2ouV6pUnYy2cH5JkcvSKKcjH83Y2vA9";
        home = "/home/nils/";
      };
    };
  };

  programs = {
    hyprland.enable = true;
    dconf.enable = true;
    # wireshark.enable = true;
    zsh = {
      enable = true;
      autosuggestions.enable = false;
      ohMyZsh.enable = true;
      ohMyZsh.plugins = [ "fzf" "zoxide" ];
      syntaxHighlighting.enable = true;
      shellAliases = {
        cd = "z";
        # ls = "eza --git --git-repos";
        ip = "ip --color=always";
        ssh = "TERM=xterm ssh";
        k = "kubectl";
        update = "sudo nixos-rebuild switch --upgrade";
        lg = "lazygit";
        upload = "~/dotfiles/scripts/upload.sh";
        vi = "nvim";
        blue = "bluetuith";
      };

      interactiveShellInit = ''
        source ${pkgs.grml-zsh-config}/etc/zsh/zshrc
        zstyle ':prompt:grml:left:items:user' pre '%F{blue}%B'
      '';

      shellInit = ''
        eval "$(direnv hook zsh)"
        export EDITOR=nvim;
        export NODE_PATH=~/.npm-packages/lib/node_modules
        export PATH=~/.npm-packages/bin:$PATH
        export PATH=~/.krew}/bin:$PATH
      '';
    };
  };
}
