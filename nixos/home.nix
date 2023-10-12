{ pkgs, lib, ... }:
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/master.tar.gz";

in let
  fromGitHub = ref: repo:
    pkgs.vimUtils.buildVimPluginFrom2Nix {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
        ref = ref;
      };
    };

in {
  home-manager.users.nils = {
    #services.opensnitch-ui.enable = true;
  };
  # nixpkgs.overlays = [
  #     (import (builtins.fetchTarball {
  #              url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #              }))
  # ];

  imports = [ (import "${home-manager}/nixos") ];

  home-manager.users.nils = {
    home.stateVersion = "22.11";

    gtk = {
      enable = true;
      theme = {
        name = "adw-gtk3";
        package = pkgs.adw-gtk3;
      };
      cursorTheme = {
        name = "macOS-Monterey";
        package = pkgs.apple-cursor;
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

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        vim-fugitive
        lsp-zero-nvim
        telescope-nvim
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        nvim-tree-lua
        plenary-nvim
        mini-nvim
        # bufferline-nvim
        nvim-web-devicons
        indent-blankline-nvim
        # trouble-nvim
        # null-ls-nvim
        # which-key-nvim
        nvim-cursorline
        nvim-autopairs
        # neodev-nvim
        wilder-nvim
        gitsigns-nvim
        nvim-comment

        catppuccin-nvim

        nvim-dap
        nvim-dap-ui
        nvim-dap-go

        luasnip

        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        lspkind-nvim
        nvim-jdtls
        cmp_luasnip
        # neorg
        markdown-preview-nvim
        # nvim-colorizer-lua
        # orgmode
        vim-table-mode
        # gruvbox-nvim
        # (fromGitHub "HEAD" "Bekaboo/dropbar.nvim")
        # (fromGitHub "HEAD" "projekt0n/github-nvim-theme")
        # (fromGitHub "HEAD" "jmbuhr/otter.nvim")
        # (fromGitHub "HEAD" "akinsho/org-bullets.nvim")
        (fromGitHub "HEAD" "jakewvincent/mkdnflow.nvim")
        # (fromGitHub "HEAD" "postfen/clipboard-image.nvim")
        # (fromGitHub "HEAD" "someone-stole-my-name/yaml-companion.nvim")
        # (fromGitHub "HEAD" "davidmh/cspell.nvim")
        (fromGitHub "HEAD" "dgagn/diagflow.nvim")
        # (fromGitHub "HEAD" "toppair/reach.nvim")
        # (fromGitHub "HEAD" "j-morano/buffer_manager.nvim")
        # (fromGitHub "HEAD" "Vonr/align.nvim")
        (fromGitHub "HEAD" "stevearc/conform.nvim")
        (fromGitHub "HEAD" "github/copilot.vim")
        # (fromGitHub "HEAD" "luckasRanarison/nvim-devdocs")
        (fromGitHub "HEAD" "stevearc/oil.nvim")
        # (fromGitHub "HEAD" "MunifTanjim/nui.nvim")
        # (fromGitHub "HEAD" "SmiteshP/nvim-navbuddy")
        # (fromGitHub "HEAD" "SmiteshP/nvim-navic")
        (fromGitHub "HEAD" "Wansmer/symbol-usage.nvim")
        # (fromGitHub "HEAD" "dccsillag/magma-nvim")
      ];
    };
  };
}
