{
  pkgs,
  inputs,
  configName,
  lib,
  ...
}:

{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;

    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "barbar.nvim"
      ];

    defaultEditor = true;

    diagnostic.settings = {
      virtual_lines = false;
      virtual_text = {
        prefix = "●";
      };
      update_in_insert = true;
      severity_sort = true;
      underline = true;
      signs = {
        text.__raw = ''
          {
            [vim.diagnostic.severity.ERROR] = "󰅙",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "󰋼",
            [vim.diagnostic.severity.HINT]  = "󰌵",
          }
        '';
      };
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = true;
      termguicolors = true;
      clipboard = "unnamedplus";
      undofile = true;
      scrolloff = 8;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      };
    };

    lsp = {
      servers = {
        bashls = {
          enable = true;
        };
        clangd = {
          enable = true;
          config = {
            cmd = [
              "clangd"
              "--background-index"
              "--clang-tidy"
              "--completion-style=detailed"
              "--header-insertion=never"
              "--function-arg-placeholders=true"
              "--query-driver=/home/jb/.platformio/packages/toolchain-*/bin/arm-none-eabi-gcc,/home/jb/.platformio/packages/toolchain-*/bin/arm-none-eabi-g++,${pkgs.gcc-arm-embedded}/bin/arm-none-eabi-gcc,${pkgs.gcc-arm-embedded}/bin/arm-none-eabi-g++,${pkgs.gcc}/bin/gcc,${pkgs.gcc}/bin/g++,${pkgs.clang}/bin/clang,${pkgs.clang}/bin/clang++"
            ];
          };
        };
        codebook = {
          enable = true;
          config = {
            filetypes = [
              "c"
              "css"
              "go"
              "haskell"
              "html"
              "java"
              "javascript"
              "javascriptreact"
              "markdown"
              "php"
              "python"
              "ruby"
              "rust"
              "toml"
              "text"
              "typescript"
              "typescriptreact"
            ];
          };
        };
        cssls = {
          enable = true;
        };
        emmet_language_server = {
          enable = true;
        };
        hls = {
          enable = true;
          config = {
            filetypes = [
              "haskell"
              "lhaskell"
              "cabal"
            ];
          };
        };
        jsonls = {
          enable = true;
        };
        ltex = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        neocmake = {
          enable = true;
        };
        nixd = {
          enable = true;
          config = {
            settings = {
              nixd =
                let
                  flakeExpr = "(builtins.getFlake (builtins.toString ~/nix))";
                in
                {
                  nixpkgs.expr = "import ${flakeExpr}.inputs.nixpkgs { }";
                  formatting.command = [ "nixfmt" ];
                  options = {
                    nixos.expr = "${flakeExpr}.nixosConfigurations.${configName}.options";
                    home_manager.expr = "${flakeExpr}.nixosConfigurations.${configName}.options.home-manager.users.type.getSubOptions []";
                  };
                };
            };
          };
        };
        pylsp = {
          enable = true;
          package = pkgs.python3.withPackages (
            ps: with ps; [
              python-lsp-server
              rope
              pyflakes
              pycodestyle
              yapf
            ]
          );
        };
        rust_analyzer = {
          enable = true;
          packageFallback = true;
          config = {
            settings = {
              rust-analyzer = {
                check = {
                  command = "clippy";
                  extra_args = [
                    "-D"
                    "warnings"
                  ];
                };
              };
            };
          };
        };
        svelte = {
          enable = true;
        };
        tailwindcss = {
          enable = true;
        };
        texlab = {
          enable = true;
          config = {
            settings = {
              texlab = {
                chktex = {
                  onEdit = true;
                  onOpenAndSave = true;
                };
              };
            };
          };
        };
        tinymist = {
          enable = true;
        };
        ts_ls = {
          enable = true;
        };
        yamlls = {
          enable = true;
        };
      };
    };

    extraPackages = with pkgs; [
      prettier
      nodejs
      nixfmt
      rustfmt
      ripgrep
    ];

    plugins = {
      barbar = {
        enable = true;
        keymaps = {
          close.key = "<A-j>";
          closeAllButCurrentOrPinned.key = "<leader>bc";
          next.key = "<A-l>";
          pick.key = "<A-k>";
          pin.key = "<leader>bp";
          previous.key = "<A-h>";
        };
      };

      blink-cmp = {
        enable = true;
        settings = {
          completion.documentation.auto_show = true;
          signature.enabled = true;
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            css = [ "prettier" ];
            html = [ "prettier" ];
            javascript = [ "prettier" ];
            nix = [ "nixfmt" ];
            python = [ "yapf" ];
            rust = [ "rustfmt" ];
            svelte = [ "prettier" ];
            typescript = [ "prettier" ];
          };
          format_on_save = {
            timeout_ms = 1000;
            lsp_fallback = true;
          };
        };
      };

      lualine = {
        enable = true;
        settings = {
          sections = {
            lualine_a = [ "mode" ];
            lualine_b = [
              "branch"
              "diff"
            ];
            lualine_c = [
              "filename"
              {
                __unkeyed-1 = "lsp_status";
                separator = "";
              }
              {
                __unkeyed-1 = "diagnostics";
                symbols = {
                  error = "󰅙 ";
                  warn = " ";
                  info = "󰋼 ";
                  hint = "󰌵 ";
                };
                update_in_insert = true;
              }
            ];
            lualine_x = [
              "encoding"
              "fileformat"
              "filetype"
            ];
            lualine_y = [ "progress" ];
            lualine_z = [ "location" ];
          };
        };
      };

      neo-tree = {
        enable = true;
        settings = {
          filesystem = {
            filtered_items = {
              visible = true;
              hide_dotfiles = false;
              hide_gitignored = true;
              hide_ignored = false;
              hide_by_name = [ ".git" ];
            };
          };
        };
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
        };
      };

      treesitter = {
        enable = true;
        grammarPackages = builtins.filter (
          g: g.pname or "" != "tree-sitter-latex"
        ) pkgs.vimPlugins.nvim-treesitter.allGrammars;
        highlight.enable = true;
        indent.enable = true;
      };

      vimtex = {
        enable = true;
        texlivePackage = null;
        settings = {
          compiler_method = "latexmk";
          view_method = "zathura";
        };
      };

      comment.enable = true;
      gitsigns.enable = true;
      lspconfig.enable = true;
      luasnip.enable = true;
      nvim-autopairs.enable = true;
      tmux-navigator.enable = true;
      which-key.enable = true;
      web-devicons.enable = true;
    };

    globals = {
      mapleader = " ";
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-f>";
        action = "<cmd>Neotree toggle<cr>";
        options = {
          silent = true;
          desc = "Toggle Neotree";
        };
      }
      {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<cr>";
        options = {
          silent = true;
          desc = "Save buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>ds";
        action.__raw = "vim.diagnostic.setloclist";
        options.desc = "diagnostic loclist";
      }
      {
        mode = "n";
        key = "<leader>fm";
        action = "<cmd>lua require('conform').format()<cr>";
        options = {
          silent = false;
          desc = "Format buffer";
        };
      }
      {
        mode = "n";
        key = "<esc>";
        action = "<cmd>noh<cr>";
        options = {
          silent = true;
          desc = "Clear highlights";
        };
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = {
          silent = true;
          desc = "Move to left window";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = {
          silent = true;
          desc = "Move to window below";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = {
          silent = true;
          desc = "Move to window above";
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options = {
          silent = true;
          desc = "Move to right window";
        };
      }
    ];
  };
}
