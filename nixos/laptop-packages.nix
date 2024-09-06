{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    inter
    cantarell-fonts
    iosevka
    vollkorn
    fira-code
    jetbrains-mono
    comic-mono
    nerdfonts
    fantasque-sans-mono
  ];

  users.users.nils.packages = with pkgs; [
    # activitywatch
    # android-studio
    # ansible
    # asciinema
    # aw-server-rust
    # awatcher
    # bibata-cursors
    # bottles
    # brave
    # bun
    # choose
    # codespell
    # eza
    # factorio
    # gh
    # gnome-extension-manager
    # gnome.dconf-editor
    # gnome.polari
    # gnomeExtensions.auto-move-windows
    # gnomeExtensions.impatience
    # gnomeExtensions.just-perfection
    # grml-zsh-config
    # helix
    # helix
    # helix
    # helix
    # helix-gpt
    # helix-gpt
    # httpie
    # inkscape
    # ledger-live-desktop
    # lorri
    # mako
    # newsflash
    # niv
    # nixos-generators
    # nodePackages_latest.pyright
    # ollama
    # pagefind
    # postman
    # pprof
    # rnote
    # rustup
    # sshpass
    # stremio
    # stremio
    # sysprof
    # tangram
    # teams
    # terraform
    # terraform-ls
    # texlab
    # texliveMedium
    # thefuck
    # trivy
    # tuxedo-rs
    # unison-ucm
    # vscode-fhs
    # vscode-fhs
    # wezterm
    # xdg-desktop-portal-gtk
    # xournalpp
    # yt-dlp
    air
    anki-bin
    argocd
    atuin
    bc
    bluetuith
    brightnessctl
    brotab
    cfssl
    cilium-cli
    clang
    delve
    dig
    direnv
    discord
    docker-compose
    du-dust
    dunst
    dwl
    etcd
    feh
    ffmpeg
    ffmpeg
    file
    firefox
    foliate
    foot
    fzf
    gammastep
    gcc
    gci
    ginkgo
    git
    gitleaks
    glibc
    gnome-tweaks
    gnumake
    go
    go-callvis
    go-mockery
    gofumpt
    golangci-lint
    golangci-lint-langserver
    google-chrome
    gopls
    goreleaser
    gotools
    gradience
    grim
    htop
    hubble
    hugo
    # hypridle
    # hyprlock
    # hyprpaper
    imagemagick
    jc
    jdk21
    jellyfin-media-player
    jq
    k6
    k9s
    keyd
    kind
    kitty
    krew
    kubebuilder
    kubectl
    kubectx
    kubernetes
    kubernetes-helm
    kubeseal
    kubeshark
    kubetail
    kustomize
    lazydocker
    lazygit
    libbpf
    libcxxStdenv # needed to compile tressitter
    libnotify
    libqalculate
    llvm
    localsend
    ltex-ls
    lua-language-server
    marksman
    mpv
    neovim
    nfs-utils
    nil
    nixfmt-classic
    nixpkgs-fmt
    nmap
    nodePackages.js-beautify
    nodePackages_latest.bash-language-server
    nodePackages_latest.prettier
    nodePackages_latest.stylelint
    nodePackages_latest.svelte-language-server
    nodePackages_latest.typescript-language-server
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    nodejs
    oapi-codegen
    obs-studio
    obsidian
    openapi-generator-cli
    openssl
    openvpn
    pandoc
    pavucontrol
    popeye
    poppler_utils
    powertop
    pyright
    python3
    python312Packages.python-lsp-server
    qalculate-gtk
    ranger
    rclone
    ripgrep
    ruff-lsp
    shellcheck
    signal-desktop
    skopeo
    slurp
    sqlitebrowser
    starship
    stylua
    swappy
    tailwindcss
    tailwindcss-language-server
    talosctl
    tcpdump
    templ
    traceroute
    tree
    unrar-wrapper
    unzip
    vial
    waybar
    wireguard-tools
    wl-clipboard
    wmctrl
    wtype
    # xdg-desktop-portal-hyprland
    xdg-utils
    zathura
    zed-editor
    zellij
    zoxide
    zsh-autosuggestions
    zsh-powerlevel10k
    zsh-syntax-highlighting
    zsh-syntax-highlighting
    zsh-you-should-use
    pre-commit
    clusterctl
    ansible
    packer
  ];
}
