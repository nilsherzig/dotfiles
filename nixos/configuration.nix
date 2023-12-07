{ pkgs, ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix # Include the results of the hardware scan.
    ./desktop.nix
    ./laptop.nix
    ./home.nix
    ./packages.nix
    ./sync.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = "1048576"; # 128 times the default 8192
    "fs.inotify.max_user_instances" = "8192";
    "clearcpuid" = "514";
  };

  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
    options hid_apple swap_opt_cmd=1
  '';

  boot.kernelParams =
    [ "amd_iommu=on" "clearcpuid=514" "vm.max_map_count=1000000" ];

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

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  systemd.network.wait-online.timeout = 0;
  boot.tmp.cleanOnBoot = true;
  boot.initrd.systemd.network.wait-online.timeout = 0;
  systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  # networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];

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

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # because via and keyboard configs # doesnt work rn 
  # the via and vial packages already do these in their install scripts, idk why they dont work
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  # or just chmod a+rw /dev/hidrawX

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
    ohMyZsh.plugins = [ "fzf" ];
    syntaxHighlighting.enable = true;
    shellAliases = {
      ip = "ip --color=always"; # ip show colors
      rclone = "rclone -P"; # always show rclone progress
      ssh = "TERM=xterm ssh"; # because of kitty
      k = "kubectl";
      update = "sudo nixos-rebuild switch --upgrade";
      lg = "lazygit";
      k9s = "k9s --logoless";
      upload = "~/dotfiles/scripts/upload.sh";
      vi = "nvim";
      b = "broot";
      blue = "bluetuith";
    };
    # promptInit = ''
    #   # autoload - U promptinit; promptinit
    #   # prompt pure
    #   source /etc/zshrc
    # '';

    interactiveShellInit = ''
      source ${pkgs.grml-zsh-config}/etc/zsh/zshrc
      zstyle ':prompt:grml:left:items:user' pre '%F{blue}%B'
    '';
    # promptInit = "source <(starship init zsh --print-full-init)"; # otherwise it'll override the grml prompt

    shellInit = ''
      eval "$(direnv hook zsh)"
      export EDITOR=hx
      export PATH=~/.npm-packages/bin:$PATH
      export NODE_PATH=~/.npm-packages/lib/node_modules
    '';
  };

  programs.hyprland.enable = true;

  fonts.packages = with pkgs; [
    cantarell-fonts
    iosevka
    fira-code
    jetbrains-mono
    comic-mono
    nerdfonts
    fantasque-sans-mono
  ];

  services.udisks2.enable = true;

  services.mullvad-vpn.enable = true;
  system.stateVersion = "22.11";

  system.autoUpgrade.enable = true;
  # system.autoUpgrade.allowReboot = false;
  services.tailscale.enable = true;
  services.passSecretService.enable = true;

  # services.emacs.enable = true;
  hardware.bluetooth.settings = { General = { Experimental = true; }; };
  # services.flatpak.enable = false;
  programs.dconf.enable = true;
  programs.adb.enable = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
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
    enable = false;
    keyboards."*".settings = {
      main = {
        # capslock = "layer(caps)";
        # rightalt = "layer(rightalt)";
        rightalt = "layer(altgr)";
        # capslock = "overload(caps, esc)";
        # capslock = "overload(caps, macro(esc :))";
        capslock = "esc";
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
    };
  };
  security.pam.services.login.googleAuthenticator.enable = true;
  security.pam.services.gdm-password.googleAuthenticator.enable = true;
}
