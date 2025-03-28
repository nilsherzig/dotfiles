{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    inter
    cantarell-fonts
    jetbrains-mono
    nerd-fonts.comic-shanns-mono
    nerd-fonts.iosevka
  ];

  nixpkgs.overlays = [ (self: super: { utillinux = super.util-linux; }) ];

  users.users."nils.herzig".packages = with pkgs; [
    air
    nil
    distrobox
    ghostty
    pika-backup
    argocd
    anki
    atuin
    ginkgo
    gnomeExtensions.day-progress
    liquidctl
    bluetuith
    brightnessctl
    btop
    clang
    cowsay
    deno
    dig
    direnv
    du-dust
    sticky-notes
    ffmpeg
    file
    firefox
    fzf
    gcc
    git
    glibc
    gnome-tweaks
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.tiling-shell
    gnumake
    go
    go-callvis
    go-mockery
    gofumpt
    golangci-lint
    golangci-lint-langserver
    gopls
    gotools
    grml-zsh-config
    htop
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    imagemagick
    jc
    jq
    k9s
    keyd
    kind
    kubebuilder
    kubectl
    kubectx
    kubeseal
    kubetail
    kustomize
    kustomize-sops
    lazydocker
    lazygit
    libbpf
    libcxxStdenv # needed to compile tressitter
    libnotify
    libqalculate
    llvm
    ltex-ls
    lua-language-server
    marksman
    mpv
    nautilus
    neovim
    nfs-utils
    nil
    nixd
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
    openssl
    openstackclient-full
    openvpn
    packer
    pandoc
    pavucontrol
    pciutils
    poppler_utils
    powertop
    pre-commit
    python3
    python312Packages.python-lsp-server
    qalculate-gtk
    rclone
    ripgrep
    ruff
    ruff-lsp
    shellcheck
    sops
    stylua
    swappy
    tcpdump
    templ
    traceroute
    tree
    typst
    typstyle
    unrar-wrapper
    unzip
    usbutils
    wl-clipboard
    wtype
    xdg-utils
    xorg.libxshmfence
    yamllint
    yq-go
    ytt
    zed-editor
    zoxide
    zsh-autosuggestions
    zsh-powerlevel10k
    zsh-syntax-highlighting
    zsh-you-should-use
  ];

  users.users.nils.packages = with pkgs; [
    aichat
    # aider-chat
    air
    android-studio
    android-tools
    anki
    atuin
    bluetuith
    brightnessctl
    # cfssl
    clang
    # delve
    dig
    direnv
    du-dust
    ffmpeg
    file
    firefox
    fzf
    # gammastep
    gcc
    git
    # gci
    # ghc
    # ginkgo
    # glas
    # gleam
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
    gotools
    # grim
    grml-zsh-config
    htop
    # hubble
    # hugo
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    imagemagick
    jc
    jdk21
    jq
    # k6
    k9s
    keyd
    kind
    kubebuilder
    kubectl
    kubectx
    kubeseal
    kubetail
    kustomize
    lazydocker
    lazygit
    libbpf
    libcxxStdenv # needed to compile tressitter
    libnotify
    libqalculate
    llvm
    # localsend
    # logisim-evolution
    ltex-ls
    lua-language-server
    marksman
    mpv
    nautilus
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
    obsidian
    openapi-generator-cli
    openssl
    openvpn
    packer
    pandoc
    pavucontrol
    pciutils
    # popeye
    poppler_utils
    powertop
    pre-commit
    prismlauncher
    python3
    python312Packages.python-lsp-server
    qalculate-gtk
    # ranger
    rclone
    ripgrep
    # rnote
    ruff
    ruff-lsp
    shellcheck
    signal-desktop
    # skopeo
    # slurp
    sqlitebrowser
    starship
    stremio
    stylua
    swappy
    tailwindcss
    tailwindcss-language-server
    # talosctl
    tcpdump
    templ
    tinymist
    traceroute
    tree
    typst
    typstyle
    unrar-wrapper
    unzip
    usbutils
    # vial
    # vscode-fhs
    # web-ext
    # wezterm
    wireguard-tools
    wl-clipboard
    # wmctrl
    wtype
    xdg-utils
    xorg.libxshmfence
    # zathura
    zed-editor
    zoxide
    zsh-autosuggestions
    zsh-powerlevel10k
    zsh-syntax-highlighting
    zsh-you-should-use
    argocd
    kubernetes-helm
    steam-run-free
    nixd
    gnomeExtensions.tiling-shell
    gnomeExtensions.bluetooth-battery-meter
    cowsay
    jetbrains-toolbox
    vencord
    kustomize-sops
    sops
    btop
    deno
    yq-go
    openstackclient-full
    ytt
    liquidctl
    pika-backup
    yamllint
    distrobox
    gnomeExtensions.day-progress
    ghostty
    distrobox
    ruff
    pomodoro-gtk
    calibre
  ];
}
