{
  pkgs,
  inputs,
  configName,
  ...
}:

{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

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
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      };
    };

    lsp = {
      enable = true;
      servers = {
        nixd = {
          enable = true;
          config = {
            settings = {
              nixd =
                let
                  flakeExpr = "(builtins.getFlake (builtins.toString ./.))";
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
        rust_analyzer = {
          enable = true;
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
      };
    };

    extraPackages = with pkgs; [
      nixfmt
      rustfmt
      ripgrep
    ];

    plugins = {
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
            nix = [ "nixfmt" ];
            rust = [ "rustfmt" ];
          };
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
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
        highlight.enable = true;
        indent.enable = true;
      };

      lspconfig.enable = true;
      neo-tree.enable = true;
      tmux-navigator.enable = true;
      gitsigns.enable = true;
      lualine.enable = true;
      nvim-autopairs.enable = true;
      comment.enable = true;
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
        key = "<leader>fm";
        action = "<cmd>lua require('conform').format()<cr>";
        options = {
          silent = false;
          desc = "Format buffer";
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
