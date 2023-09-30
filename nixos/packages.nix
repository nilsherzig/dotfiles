{ pkgs, ... }: {
  users.users.nils.packages = with pkgs; [
    act
    adw-gtk3
    ansible
    asciinema
    # atuin
    bat
    # bfg-repo-cleaner
    bluetuith
    bottles
    brightnessctl
    taplo
    broot
    # cdrtools
    # celluloid
    #chat
    cilium-cli
    clang-tools
    clang-tools
    clusterctl
    # container
    containerlab
    deja-dup
    delve
    # desktop things / using gnome in this case
    dig
    direnv
    discord
    # discordo
    # distrobox
    distrobox
    docker
    docker-compose
    dolphin-emu
    du-dust
    # evince
    # evolution
    fd
    feh
    ffmpeg
    # firefox
    fzf
    #games
    gammastep
    gaphor
    gcc
    # gh
    # ghidra-bin
    # gimp
    ginkgo
    git
    gitlab-runner
    gitleaks
    gnome.adwaita-icon-theme
    gnome.eog
    # gnome-extension-manager
    # gnomeExtensions.blur-my-shell
    # gnomeExtensions.mullvad-indicator
    # gnomeExtensions.tray-icons-reloaded
    gnome.gnome-clocks
    # gnome.gnome-control-center
    gnome.gnome-disk-utility
    gnome.gnome-font-viewer
    # gnome.gnome-tweaks
    gnome.nautilus
    # gnome shell 
    gnome.simple-scan
    # gnome.sushi
    gnumake
    go
    golangci-lint
    gomodifytags
    google-chrome
    gopls
    gore
    gotests
    go-tools
    gotools
    gping
    gradience
    # gradle_7
    grim
    grml-zsh-config
    # hardware / stats
    helix
    html-tidy
    hubble
    # images
    imlib2Full
    # internet
    # jdk17
    jdt-language-server
    # jellyfin-media-player
    jellyfin-media-player
    jq
    k3d
    k3sup
    k9s
    kind
    kitty
    # kodi-wayland
    kubectl
    kubectx
    kubernetes-helm
    kubeseal
    # language server
    lazydocker
    lazygit
    # lens
    libnotify
    libqalculate
    # libs
    libwebp
    liquidctl
    litecli
    lm_sensors
    ltex-ls
    ltrace
    lua-language-server
    lua-language-server
    luarocks
    # lxappearance
    # mail 
    #mail 
    mako
    marksman
    masscan
    minikube
    # misc
    mission-center
    mpv
    # neovim
    nil
    nixfmt
    nixpkgs-fmt
    nixpkgs-fmt
    nmap
    nnn
    nodejs
    nodePackages.js-beautify
    nodePackages_latest.bash-language-server
    nodePackages_latest.bash-language-server
    nodePackages_latest.prettier
    nodePackages_latest.prettier
    nodePackages_latest.pyright
    nodePackages_latest.stylelint
    nodePackages_latest.svelte-language-server
    nodePackages_latest.typescript-language-server
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    obsidian
    obs-studio
    # openrgb
    # opensnitch-ui
    openvpn
    # other things
    pandoc
    pavucontrol
    pciutils
    # polkit
    # polkit_gnome
    popeye
    prismlauncher
    # prismlauncher-qt5
    # protonmail-bridge
    # protonmail-bridge
    # pure-prompt
    python311
    python311Packages.bpython
    python311Packages.diagrams
    python311Packages.python-lsp-server
    python311Packages.recipe-scrapers
    radare2
    radeontop
    ranger
    rclone
    ripgrep
    rsync
    rust-analyzer
    ryujinx
    shellcheck
    signal-desktop
    slurp
    speedtest-cli
    sqlite
    sshfs
    steam
    swappy
    swaybg
    syncthing
    terraform
    terraform-ls
    texlive.combined.scheme-medium
    texlab
    # theme
    #theme
    tmux
    # tofi
    traceroute
    tree
    typescript
    typst
    typst-fmt
    typst-lsp
    # udisks # gnome disks backend
    unrar-wrapper
    unzip
    usbutils
    via # somehow doesnt work, appimage in repo works on arch tho
    # video 
    virt-manager
    virtualenv
    # vscode
    vscode.fhs
    websocat
    # whatsapp-for-linux
    # window manager tools
    wine
    # wireshark
    wl-clipboard
    # wofi
    wtype
    xdg-desktop-portal-hyprland
    xdg-utils
    yamlfmt
    yarn
    # ydotool
    yt-dlp
    yuzu-early-access
    zathura
    zoxide
    zsh-syntax-highlighting
  ];
}
