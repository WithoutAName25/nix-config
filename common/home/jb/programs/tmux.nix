{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
    clock24 = true;
    historyLimit = 50000;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];

    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides ":Ss=\E[%p1%d q:Se=\E[ q"
      set-environment -g COLORTERM "truecolor"

      set-option -g renumber-windows on

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      bind y copy-mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    '';
  };
}
