{
  inputs,
  pkgs,
  ...
}:

{
  imports = [ inputs.niri-nix.homeModules.default ];

  wayland.windowManager.niri = {
    enable = true;

    systemd.variables = [ "--all" ];

    settings = {
      input = {
        keyboard = {
          xkb = {
            layout = "de";
            variant = "nodeadkeys";
          };
          numlock = [ ];
        };

        touchpad = {
          tap = [ ];
          natural-scroll = [ ];
        };

        warp-mouse-to-focus = {
          _props.mode = "center-xy-always";
        };

        focus-follows-mouse = {
          _props.max-scroll-amount = "20%";
        };

        disable-power-key-handling = [ ];
      };

      output = [
        {
          _args = [ "Iiyama North America PL2493H 1211524912688" ];
          scale = 1;
          transform = "90";
          position._props = {
            x = -1080;
            y = -420;
          };
          mode = "1920x1080@74.973";
          layout = {
            default-column-width = {
              proportion = 1.0;
            };
            preset-column-widths._children = [
              { proportion = 0.5; }
              { proportion = 1.0; }
            ];
          };
        }
        {
          _args = [ "Microstep MSI MAG241C 0x000001C5" ];
          scale = 1;
          position._props = {
            x = 0;
            y = 0;
          };
          mode = "1920x1080@143.855";
          focus-at-startup = [ ];
        }
        {
          _args = [ "Iiyama North America PL2493H 1211524912189" ];
          scale = 1;
          transform = "270";
          position._props = {
            x = 1920;
            y = -420;
          };
          mode = "1920x1080@74.973";
          layout = {
            default-column-width = {
              proportion = 1.0;
            };
            preset-column-widths._children = [
              { proportion = 0.5; }
              { proportion = 1.0; }
            ];
          };
        }
      ];

      layout = {
        gaps = 10;

        focus-ring = {
          width = 2;
          urgent-color = "#f38ba8";
          active-color = "#74c7ec";
          inactive-color = "#0000";
        };

        border = {
          off = [ ];
        };

        background-color = "#1e1e2e";

        shadow = {
          on = [ ];
          offset._props = {
            x = 0.0;
            y = 5.0;
          };
          softness = 30;
          spread = 5;
          draw-behind-window = false;
          color = "#0004";
        };

        default-column-width = {
          proportion = 0.5;
        };

        preset-column-widths._children = [
          { proportion = 0.333333; }
          { proportion = 0.5; }
          { proportion = 0.666667; }
        ];

        center-focused-column = "never";
        always-center-single-column = [ ];
      };

      screenshot-path = null;
      prefer-no-csd = [ ];

      overview = {
        zoom = 0.33;
        backdrop-color = "#11111b";
      };

      hotkey-overlay = {
        skip-at-startup = [ ];
      };

      layer-rule = [
        {
          match = {
            _props.namespace = "^launcher$";
          };
          geometry-corner-radius = 12;
          background-effect = {
            blur = true;
            xray = false;
          };
        }
      ];

      window-rule = [
        {
          geometry-corner-radius = 12;
          clip-to-geometry = true;
          background-effect = {
            blur = true;
            xray = false;
          };
        }
        {
          match = {
            _props.app-id = "^zen";
          };
          open-maximized = true;
        }
      ];

      environment = {
        "QT_QPA_PLATFORM" = "wayland";
        "QT_WAYLAND_DISABLE_WINDOWDECORATION" = "1";
      };

      spawn-at-startup = [
        (
          let
            wallpaper = "${pkgs.nixos-artwork.wallpapers.catppuccin-mocha.gnomeFilePath}";
            rotatedWallpaper = pkgs.runCommand "wallpaper-rotated.png" {
              nativeBuildInputs = [ pkgs.imagemagick ];
            } "magick ${wallpaper} -rotate 90 $out";
          in
          [
            "${pkgs.swaybg}/bin/swaybg"
            "--image"
            "${wallpaper}"
            "--mode"
            "fit"
            "--output"
            "DP-2"
            "--image"
            "${rotatedWallpaper}"
            "--output"
            "DP-3"
            "--image"
            "${rotatedWallpaper}"
          ]
        )
        [
          "steam"
          "-silent"
        ]
      ];
      # spawn-sh-at-startup = [ ];

      gestures = {
        hot-corners = {
          off = [ ];
        };
      };

      binds = {
        "Ctrl+Alt+Delete" = {
          _props.repeat = false;
          quit = [ ];
        };
        "Mod+Escape" = {
          _props.repeat = false;
          _props.allow-inhibiting = false;
          toggle-keyboard-shortcuts-inhibit = [ ];
        };

        "Mod+R" = {
          _props.repeat = false;
          spawn = [
            "fuzzel"
          ];
        };
        "Mod+Y" = {
          _props.repeat = false;
          spawn = [
            "kitty"
            "tmux"
          ];
        };
        "Mod+X" = {
          _props.repeat = false;
          spawn = [
            "kitty"
            "--class"
            "clipse"
            "clipse"
          ];
        };

        "Mod+C" = {
          _props.repeat = false;
          close-window = [ ];
        };
        "Mod+Q" = {
          _props.repeat = false;
          toggle-column-tabbed-display = [ ];
        };
        "Mod+Space" = {
          _props.repeat = false;
          switch-focus-between-floating-and-tiling = [ ];
        };
        "Mod+Shift+Space" = {
          _props.repeat = false;
          toggle-window-floating = [ ];
        };
        "Mod+Shift+V" = {
          _props.repeat = false;
          fullscreen-window = [ ];
        };
        "Mod+V" = {
          _props.repeat = false;
          maximize-column = [ ];
        };
        "Mod+O" = {
          _props.repeat = false;
          toggle-overview = [ ];
        };

        "Mod+H" = {
          focus-column-left = [ ];
        };
        "Mod+J" = {
          focus-window-down = [ ];
        };
        "Mod+K" = {
          focus-window-up = [ ];
        };
        "Mod+L" = {
          focus-column-right = [ ];
        };

        "Mod+WheelScrollRight" = {
          focus-column-right = [ ];
        };
        "Mod+WheelScrollLeft" = {
          focus-column-left = [ ];
        };
        "Mod+WheelScrollUp" = {
          focus-window-or-workspace-up = [ ];
        };
        "Mod+WheelScrollDown" = {
          focus-window-or-workspace-down = [ ];
        };

        "Mod+Shift+H" = {
          move-column-left = [ ];
        };
        "Mod+Shift+J" = {
          move-window-down = [ ];
        };
        "Mod+Shift+K" = {
          move-window-up = [ ];
        };
        "Mod+Shift+L" = {
          move-column-right = [ ];
        };

        "Mod+Shift+WheelScrollRight" = {
          move-column-right = [ ];
        };
        "Mod+Shift+WheelScrollLeft" = {
          move-column-left = [ ];
        };
        "Mod+Shift+WheelScrollUp" = {
          move-window-up-or-to-workspace-up = [ ];
        };
        "Mod+Shift+WheelScrollDown" = {
          move-window-down-or-to-workspace-down = [ ];
        };

        "Mod+Ctrl+H" = {
          consume-or-expel-window-left = [ ];
        };
        "Mod+Ctrl+J" = {
          consume-window-into-column = [ ];
        };
        "Mod+Ctrl+K" = {
          expel-window-from-column = [ ];
        };
        "Mod+Ctrl+L" = {
          consume-or-expel-window-right = [ ];
        };

        "Mod+N" = {
          focus-monitor-left = [ ];
        };
        "Mod+M" = {
          focus-workspace-down = [ ];
        };
        "Mod+Comma" = {
          focus-workspace-up = [ ];
        };
        "Mod+Period" = {
          focus-monitor-right = [ ];
        };

        "Mod+Shift+N" = {
          move-column-to-monitor-left = [ ];
        };
        "Mod+Shift+M" = {
          move-column-to-workspace-down = [ ];
        };
        "Mod+Shift+Comma" = {
          move-column-to-workspace-up = [ ];
        };
        "Mod+Shift+Period" = {
          move-column-to-monitor-right = [ ];
        };

        "Mod+Ctrl+N" = {
          move-workspace-to-monitor-left = [ ];
        };
        "Mod+Ctrl+M" = {
          move-workspace-down = [ ];
        };
        "Mod+Ctrl+Comma" = {
          move-workspace-up = [ ];
        };
        "Mod+Ctrl+Period" = {
          move-workspace-to-monitor-right = [ ];
        };

        "Mod+W" = {
          switch-preset-column-width = [ ];
        };
        "Mod+Shift+W" = {
          switch-preset-column-width-back = [ ];
        };

        "Mod+E" = {
          switch-preset-window-height = [ ];
        };
        "Mod+Shift+E" = {
          switch-preset-window-height-back = [ ];
        };
        "Mod+Ctrl+E" = {
          reset-window-height = [ ];
        };

        "XF86AudioRaiseVolume" = {
          spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+";
        };
        "XF86AudioLowerVolume" = {
          spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
        };
        "XF86AudioMute" = {
          spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
        "XF86AudioMicMute" = {
          spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };
        "XF86AudioPlay" = {
          spawn-sh = "playerctl play-pause";
        };
        "XF86AudioNext" = {
          spawn-sh = "playerctl next";
        };
        "XF86AudioPrev" = {
          spawn-sh = "playerctl previous";
        };
      };
    };
  };
}
