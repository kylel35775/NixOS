{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];
  programs.nvf = {
    enable = true;

    settings.vim = {
      vimAlias = true;
      viAlias = true;
      withNodeJs = true;
      lineNumberMode = "number";
      preventJunkFiles = true;
      enableLuaLoader = true;

      telescope.enable = true;
      autopairs.nvim-autopairs.enable = true;
      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;
      tabline.nvimBufferline.enable = true;
      treesitter.context.enable = false;
      projects.project-nvim.enable = true;
      dashboard.dashboard-nvim.enable = true;
      session.nvim-session-manager.enable = false;
      comments.comment-nvim.enable = true;

      lazy.plugins = {
        "edgy.nvim" = {
          package = pkgs.vimPlugins.edgy-nvim;
          event = "VeryLazy";
          cmd = ["EdgyOpen"];

          setupOpts = {
            laststatus = 3;
            splitkeep = "screen";
          };
        };
      };

      filetree.neo-tree = {
        enable = true;

        setupOpts = {
          enable_cursor_hijack = true;
          enable_git_status = true;
          git_status_async = true;
          open_files_in_last_window = true;
        };
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus";

        providers = {
          wl-copy.enable = true;
          xsel.enable = true;
        };
      };

      options = {
        tabstop = 2;
        shiftwidth = 2;
        wrap = false;
      };

      keymaps = [
        {
          key = "jk";
          mode = ["i"];
          action = "<ESC>";
          desc = "Exit insert mode";
        }
        {
          key = "<leader>nh";
          mode = ["n"];
          action = ":nohl<CR>";
          desc = "Clear search highlights";
        }
        {
          key = "<leader>ff";
          mode = ["n"];
          action = "<cmd>Telescope find_files<cr>";
          desc = "Search files by name";
        }
        {
          key = "<leader>lg";
          mode = ["n"];
          action = "<cmd>Telescope live_grep<cr>";
          desc = "Search files by contents";
        }
        {
          key = "<leader>fe";
          mode = ["n"];
          action = "<cmd>Neotree toggle<cr>";
          desc = "File browser toggle";
        }
        {
          key = "<C-h>";
          mode = ["i"];
          action = "<Left>";
          desc = "Move left in insert mode";
        }
        {
          key = "<C-j>";
          mode = ["i"];
          action = "<Down>";
          desc = "Move down in insert mode";
        }
        {
          key = "<C-k>";
          mode = ["i"];
          action = "<Up>";
          desc = "Move up in insert mode";
        }
        {
          key = "<C-l>";
          mode = ["i"];
          action = "<Right>";
          desc = "Move right in insert mode";
        }
      ];

      spellcheck = {
        enable = true;
        languages = ["en"];

        programmingWordlist.enable = true;
      };

      lsp = {
        enable = true;
        formatOnSave = true;

        lspkind.enable = false;
        lightbulb.enable = false;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
        otter-nvim.enable = false;
        nvim-docs-view.enable = false;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        clang.enable = true;
        zig.enable = true;
        python.enable = true;
        markdown.enable = true;
        ts = {
          enable = true;
          format.type = "prettier";
        };
        html.enable = true;
        lua.enable = true;
        css = {
          enable = true;
          format.type = "prettier";
        };
        rust = {
          enable = true;
          crates.enable = true;
        };
      };

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        indent-blankline.enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "base16";
      };

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false; # throws an annoying debug message
      };

      notify = {
        nvim-notify.enable = true;
        nvim-notify.setupOpts.background_colour = "#${config.lib.stylix.colors.base01}";
      };

      utility = {
        preview.markdownPreview.enable = true;
        ccc.enable = false;
        vim-wakatime.enable = false;
        icon-picker.enable = true;
        surround.enable = true;
        diffview-nvim.enable = true;
        images.image-nvim.enable = false;

        motion = {
          hop.enable = true;
          leap.enable = true;
          precognition.enable = false;
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        illuminate.enable = true;
        fastaction.enable = true;

        breadcrumbs = {
          enable = false;
          navbuddy.enable = false;
        };

        smartcolumn = {
          enable = false;
        };
      };
    };
  };
}
