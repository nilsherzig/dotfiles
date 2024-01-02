{ pkgs, ... }: {
  # nix.settings = {
  #   substituters = [ "https://42loco42.cachix.org" ];
  #   trusted-public-keys =
  #     [ "42loco42.cachix.org-1:6HvWFER3RdTSqEZDznqahkqaoI6QCOiX2gRpMMsThiQ=" ];
  # };

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
  ];

  users.users.nils.packages = with pkgs; [
    # neovim-nightly
    #     (python310.withPackages (ps:
    #       with ps; [
    #         python310Packages.bpython
    #         python310Packages.diagrams
    #         python310Packages.jupyter_client
    #         python310Packages.pillow
    #         python310Packages.pynvim
    #         python310Packages.python-lsp-server
    #         python310Packages.recipe-scrapers
    #       ]))
    # act
    # adw-gtk3
    # ansible
    # asciinema
    # bat
    # broot
    # cilium-cli
    # clang-tools
    # clang-tools
    # clusterctl
    # containerlab
    # deja-dup
    # dig
    # discord
    # distrobox
    # docker
    # docker-compose
    # dolphin-emu
    # etcd
    # fd
    # gaphor
    # gitlab-runner
    # gitleaks
    # glow
    # gnome.adwaita-icon-theme
    # gnome.eog
    # gnome.gnome-clocks
    # gnome.gnome-disk-utility
    # gnome.nautilus
    # gnome.simple-scan
    # go-tools
    # gomodifytags
    # gore
    # gotests
    # gotools
    # gping
    # graphviz
    # html-tidy
    # hubble
    # imlib2Full
    # jdt-language-server
    # jq
    # k3d
    # k3sup
    # libwebp
    # litecli
    # lm_sensors
    # ltrace
    # luarocks
    # masscan
    # minikube
    # nixpkgs-fmt
    # nmap
    # nnn
    # nodePackages_latest.rollup
    # obs-studio
    # pciutils
    # radare2
    # radeontop
    # rclone
    # redisinsight
    # rsync
    # rust-analyzer
    # ryujinx
    # shell_gpt
    # speedtest-cli
    # sqlite
    # sshfs
    # steam
    # syncthing
    # taplo
    # terraform
    # terraform-ls
    # texlab
    # texlive.combined.scheme-medium
    # traceroute
    # typescript
    # typst
    # typst-fmt
    # typst-lsp
    # ueberzug
    # ueberzugpp
    # usbutils
    # virtualenv
    # websocat
    # wine
    # xplr
    # yamlfmt
    # yarn
    # ytfzf
    # zoxide
    aichat
    air
    anki-bin
    argocd
    bluetuith
    bottles
    brightnessctl
    bun
    cfssl
    choose
    delve
    direnv
    discord
    dmg2img
    du-dust
    feh
    ffmpeg
    ffmpeg
    file
    firefox
    fx-cast-bridge
    fzf
    gammastep
    gcc
    ginkgo
    git
    glibc
    gnome.gnome-font-viewer
    gnome.gnome-tweaks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.tiling-assistant
    gnumake
    go
    golangci-lint
    google-authenticator
    google-chrome
    gopls
    goreleaser
    gradience
    grim
    grml-zsh-config
    helix
    htop
    imagemagick
    jc
    jdk21
    jellyfin-media-player
    jq
    jq
    jq
    k9s
    kind
    kitty
    kubebuilder
    kubectl
    kubectx
    kubernetes-helm
    kubeseal
    lazydocker
    lazygit
    libnotify
    libqalculate
    liquidctl
    ltex-ls
    lua-language-server
    mako
    marksman
    mpv
    nil
    nix-output-monitor
    nixfmt
    nodePackages.js-beautify
    nodePackages_latest.bash-language-server
    nodePackages_latest.prettier
    nodePackages_latest.pyright
    nodePackages_latest.stylelint
    nodePackages_latest.svelte-language-server
    nodePackages_latest.typescript-language-server
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    nodejs
    obs-studio
    obsidian
    openssl
    openvpn
    pandoc
    pavucontrol
    popeye
    poppler_utils
    prismlauncher
    protobuf
    protoc-gen-go
    python3
    python311Packages.python-lsp-server
    ranger
    ripgrep
    ruff-lsp
    shell_gpt
    shellcheck
    signal-desktop
    slurp
    stylua
    swappy
    swaybg
    tailwindcss
    tailwindcss-language-server
    tmux
    tree
    unrar-wrapper
    unzip
    ventoy-full
    via
    vial
    virt-manager
    vscode-fhs
    waybar
    wezterm
    wine64
    wl-clipboard
    wtype
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
    yt-dlp
    yuzu-early-access
    zathura
    zsh-syntax-highlighting
  ];
}
