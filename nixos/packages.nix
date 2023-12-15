{ pkgs, ... }: {
  # nix.settings = {
  #   substituters = [ "https://42loco42.cachix.org" ];
  #   trusted-public-keys =
  #     [ "42loco42.cachix.org-1:6HvWFER3RdTSqEZDznqahkqaoI6QCOiX2gRpMMsThiQ=" ];
  # };

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  users.users.nils.packages = with pkgs; [
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
    air
    anki-bin
    # ansible
    argocd
    # asciinema
    # bat
    bluetuith
    bottles
    brightnessctl
    # broot
    cfssl
    # cilium-cli
    # clang-tools
    # clang-tools
    # clusterctl
    # containerlab
    # deja-dup
    delve
    # dig
    direnv
    # discord
    discord
    # distrobox
    dmg2img
    # docker
    # docker-compose
    # dolphin-emu
    du-dust
    # etcd
    # fd
    feh
    ffmpeg
    ffmpeg
    file
    firefox
    fzf
    gammastep
    # gaphor
    gcc
    ginkgo
    git
    # gitlab-runner
    # gitleaks
    glibc
    # glow
    # gnome.adwaita-icon-theme
    # gnome.eog
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.tiling-assistant
    # gnome.gnome-clocks
    # gnome.gnome-disk-utility
    gnome.gnome-font-viewer
    gnome.gnome-tweaks
    # gnome.nautilus
    # gnome.simple-scan
    gnumake
    go
    golangci-lint
    # gomodifytags
    google-authenticator
    google-chrome
    gopls
    # gore
    goreleaser
    # gotests
    # go-tools
    # gotools
    # gping
    gradience
    # graphviz
    grim
    grml-zsh-config
    helix
    # html-tidy
    htop
    # hubble
    imagemagick
    # imlib2Full
    jc
    jdk21
    # jdt-language-server
    jellyfin-media-player
    # jq
    jq
    jq
    jq
    # k3d
    # k3sup
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
    # libwebp
    liquidctl
    # litecli
    # lm_sensors
    ltex-ls
    # ltrace
    lua-language-server
    # luarocks
    mako
    marksman
    # masscan
    # minikube
    mpv
    nil
    nixfmt
    nix-output-monitor
    # nixpkgs-fmt
    # nmap
    # nnn
    nodejs
    nodePackages.js-beautify
    nodePackages_latest.bash-language-server
    nodePackages_latest.prettier
    nodePackages_latest.pyright
    nodePackages_latest.stylelint
    nodePackages_latest.svelte-language-server
    nodePackages_latest.typescript-language-server
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    obsidian
    # obs-studio
    obs-studio
    openssl
    openvpn
    pandoc
    pavucontrol
    # pciutils
    popeye
    poppler_utils
    prismlauncher
    python3
    python311Packages.python-lsp-server
    # radare2
    # radeontop
    ranger
    # rclone
    # redisinsight
    ripgrep
    # rsync
    # rust-analyzer
    # ryujinx
    shellcheck
    # shell_gpt
    signal-desktop
    slurp
    # speedtest-cli
    # sqlite
    # sshfs
    # steam
    swappy
    swaybg
    # syncthing
    # taplo
    # terraform
    # terraform-ls
    # texlab
    # texlive.combined.scheme-medium
    tmux
    # traceroute
    tree
    # typescript
    # typst
    # typst-fmt
    # typst-lsp
    # ueberzug
    # ueberzugpp
    unrar-wrapper
    unzip
    # usbutils
    ventoy-full
    via
    vial
    virt-manager
    # virtualenv
    vscode-fhs
    waybar
    # websocat
    wezterm
    # wine
    wine64
    wl-clipboard
    # wtype
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
    # xplr
    # yamlfmt
    # yarn
    yt-dlp
    # ytfzf
    yuzu-early-access
    zathura
    # zoxide
    zsh-syntax-highlighting
    tailwindcss-language-server
    ruff-lsp
    tailwindcss
    choose
  ];
}
