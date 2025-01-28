{ pkgs, ... }:
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  home-manager.users.nils = {
    #services.opensnitch-ui.enable = true;
  };
  # nixpkgs = { overlays = [ inputs.neovim-nightly-overlay.overlay ]; };
  # home.packages = with pkgs; [ neovim-nightly ];

  imports = [ (import "${home-manager}/nixos") ];

  home-manager.users.nils = {
    home.stateVersion = "22.11";

    gtk = {
      enable = true;
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
    };

    home.sessionPath = [ "$HOME/.rd/bin" ];

    home.file."firefox-gnome-theme" = {
      target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
      source = (fetchTarball
        "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/master.tar.gz");
    };

    programs.firefox = {
      enable = true;
      policies = {
        ExtensionSettings = {
          # LeechBlock NG extension ID
          "leechblockng@proginosko.com" = {
            installation_mode = "force_installed";
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/leechblockng@proginosko.com/latest.xpi";
            # Prevents the user from disabling or removing the extension
            locked = true;
          };
        };
        # # Disable about:addons page to prevent access to extension management
        # BlockAboutAddons = true;
        # # Disable about:config to prevent advanced configuration changes
        # BlockAboutConfig = true;
      };
      profiles.default = {
        name = "Default";
        settings = {
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.tabs.drawInTitlebar" = true;
          "svg.context-properties.content.enabled" = true;
        };
        userChrome = ''
          @import "firefox-gnome-theme/userChrome.css";
          @import "firefox-gnome-theme/theme/colors/dark.css";
        '';
      };
    };

    # programs.neovim = {
    #   # package = nixpkgs.neovim-nightly;
    #   enable = false;
    #   defaultEditor = true;
    #   plugins = with pkgs.vimPlugins; [
    #     # bufferline-nvim
    #     # cmp_luasnip
    #     # dropbar-nvim
    #     # git-blame-nvim
    #     # lush-nvim
    #     # neodev-nvim
    #     # neorg
    #     # null-ls-nvim
    #     # nvim-colorizer-lua
    #     # nvim-dap
    #     # nvim-dap-go
    #     # nvim-dap-ui
    #     # nvim-jdtls
    #     # orgmode
    #     # symbols-outline-nvim
    #     # vista-vim
    #     # which-key-nvim
    #     # zenbones-nvim
    #     catppuccin-nvim
    #     cmp-buffer
    #     cmp-cmdline
    #     cmp-nvim-lsp
    #     cmp-path
    #     comment-nvim
    #     copilot-vim
    #     gitsigns-nvim
    #     gruvbox-material
    #     gruvbox-nvim
    #     indent-blankline-nvim
    #     kanagawa-nvim
    #     lsp-zero-nvim
    #     lspkind-nvim
    #     luasnip
    #     markdown-preview-nvim
    #     mini-nvim
    #     nvim-autopairs
    #     nvim-cmp
    #     nvim-cursorline
    #     nvim-highlight-colors
    #     nvim-lspconfig
    #     nvim-tree-lua
    #     nvim-treesitter-textsubjects
    #     nvim-treesitter.withAllGrammars
    #     nvim-web-devicons
    #     plenary-nvim
    #     rose-pine
    #     telescope-nvim
    #     # trouble-nvim
    #     vim-fugitive
    #     vim-table-mode
    #     vim-test
    #     wilder-nvim
    #     lazy-nvim
    #     # (fromGitHub "dev" "folke/trouble.nvim")
    #     (fromGitHub "HEAD" "folke/edgy.nvim")
    #     # (fromGitHub "HEAD" "Bekaboo/dropbar.nvim")
    #     # (fromGitHub "HEAD" "MunifTanjim/nui.nvim")
    #     # (fromGitHub "HEAD" "SmiteshP/nvim-navbuddy")
    #     # (fromGitHub "HEAD" "SmiteshP/nvim-navic")
    #     # (fromGitHub "HEAD" "Vonr/align.nvim")
    #     # (fromGitHub "HEAD" "Wansmer/symbol-usage.nvim")
    #     # (fromGitHub "HEAD" "akinsho/org-bullets.nvim")
    #     # (fromGitHub "HEAD" "davidmh/cspell.nvim")
    #     # (fromGitHub "HEAD" "dccsillag/magma-nvim")
    #     # (fromGitHub "HEAD" "dgagn/diagflow.nvim")
    #     # (fromGitHub "HEAD" "github/copilot.vim")
    #     # (fromGitHub "HEAD" "j-morano/buffer_manager.nvim")
    #     # (fromGitHub "HEAD" "jmbuhr/otter.nvim")
    #     # (fromGitHub "HEAD" "luckasRanarison/nvim-devdocs")
    #     # (fromGitHub "HEAD" "postfen/clipboard-image.nvim")
    #     (fromGitHub "HEAD" "projekt0n/github-nvim-theme")
    #     # (fromGitHub "HEAD" "someone-stole-my-name/yaml-companion.nvim")
    #     # (fromGitHub "HEAD" "toppair/reach.nvim")
    #     # (fromGitHub "HEAD" "zbirenbaum/copilot-cmp")
    #     # (fromGitHub "HEAD" "zbirenbaum/copilot.lua")
    #     # (fromGitHub "HEAD" "jakewvincent/mkdnflow.nvim")
    #     (fromGitHub "HEAD" "stevearc/conform.nvim")
    #     # (fromGitHub "HEAD" "Wansmer/symbol-usage.nvim")
    #     (fromGitHub "HEAD" "stevearc/oil.nvim")
    #     # (fromGitHub "HEAD" "Mofiqul/adwaita.nvim")
    #     # (fromGitHub "HEAD" "David-Kunz/gen.nvim")
    #   ];
    # };
  };
}
