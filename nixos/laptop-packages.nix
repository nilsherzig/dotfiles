{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    inter
    cantarell-fonts
    # iosevka
    # vollkorn
    # fira-code
    jetbrains-mono
    # comic-mono
    # fantasque-sans-mono
    nerd-fonts.iosevka
  ];
  nixpkgs.overlays = [ (self: super: { utillinux = super.util-linux; }) ];

  users.users.nils.packages = with pkgs; [
    # activitywatch
    # ansible
    # asciinema
    # aw-server-rust
    # awatcher
    # bibata-cursors
    # bottles
    # bottles
    # brave
    # bun
    # choose
    # codespell
    # d2
    # eza
    # factorio
    # foot
    # gh
    # gitleaks
    # glab
    # gnome-extension-manager
    # gnome.dconf-editor
    # gnome.polari
    # gnomeExtensions.auto-move-windows
    # gnomeExtensions.impatience
    # gnomeExtensions.just-perfection
    # httpie
    # inkscape
    # ledger-live-desktop
    # lorri
    # mako
    # moonlight-qt
    # newsflash
    # niv
    # nixos-generators
    # nodePackages_latest.pyright
    # ollama
    # pagefind
    # playwright
    # playwright-driver
    # playwright-driver.browsers
    # postman
    # postman
    # pprof
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
    # xdg-desktop-portal-gtk
    # xdg-desktop-portal-hyprland
    # yt-dlp
    aider-chat
    air
    android-studio
    android-tools
    # anki-bin
    anki
    ansible
    argocd
    atuin
    bc
    bluetuith
    brightnessctl
    brotab
    cfssl
    cilium-cli
    clang
    clusterctl
    ddcutil
    deja-dup
    delve
    dig
    direnv
    discord
    docker-compose
    du-dust
    dunst
    dwl
    erlang
    etcd
    feh
    ffmpeg
    ffmpeg
    file
    firefox
    foliate
    fzf
    gammastep
    gcc
    gci
    ghc
    ginkgo
    git
    glas
    gleam
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
    grml-zsh-config
    haskell-language-server
    htop
    hubble
    hugo
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    hypridle
    hyprlock
    hyprpaper
    ibus-engines.typing-booster
    imagemagick
    jc
    jdk21
    jellyfin-media-player
    jetbrains.idea-ultimate
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
    logisim-evolution
    ltex-ls
    lua-language-server
    marksman
    mpv
    nautilus
    neovim
    nfs-utils
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
    packer
    pandoc
    pavucontrol
    pciutils
    popeye
    poppler_utils
    powertop
    pre-commit
    prismlauncher
    pyright
    python3
    python312Packages.python-lsp-server
    qalculate-gtk
    ranger
    rclone
    rclone
    ripgrep
    rnote
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
    typst
    typst-lsp
    typstyle
    unrar-wrapper
    unzip
    usbutils
    vial
    waybar
    wezterm
    wireguard-tools
    wl-clipboard
    wmctrl
    wtype
    xdg-utils
    xournalpp
    zathura
    zed-editor
    zellij
    zoxide
    zsh-autosuggestions
    zsh-powerlevel10k
    zsh-syntax-highlighting
    zsh-syntax-highlighting
    zsh-you-should-use
    web-ext
    xorg.libxshmfence
    aichat
  ];
}
