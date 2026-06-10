{ ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # Remap prefix from Ctrl+b to Ctrl+a
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix

      # Split panes with | and -
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # New windows open in current directory
      bind c new-window -c "#{pane_current_path}"

      # Switch panes with Alt+arrow
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Resize panes with prefix + h/j/k/l
      bind h resize-pane -L 2
      bind j resize-pane -D 2
      bind k resize-pane -U 2
      bind l resize-pane -R 2

      # Switch windows with Shift+arrow
      bind -n S-Left previous-window
      bind -n S-Right next-window

      # Enable mouse support
      set -g mouse on

      # Start numbering at 1
      set -g base-index 1
      setw -g pane-base-index 1
      set -g renumber-windows on

      # Don't rename windows automatically
      set -g allow-rename off

      # Increase scrollback buffer
      set -g history-limit 50000

      # Reduce escape delay
      set -sg escape-time 0

      # True color support
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Reload config with prefix + r
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      # Status bar styling
      set -g status-position bottom
      set -g status-style "bg=#1e1e2e,fg=#cdd6f4"
      set -g status-left " #S "
      set -g status-left-style "bg=#89b4fa,fg=#1e1e2e,bold"
      set -g status-right " %H:%M %d-%b "
      set -g status-right-style "bg=#89b4fa,fg=#1e1e2e,bold"
      setw -g window-status-format " #I:#W "
      setw -g window-status-current-format " #I:#W "
      setw -g window-status-current-style "bg=#cba6f7,fg=#1e1e2e,bold"

      # Active pane border
      set -g pane-active-border-style "fg=#89b4fa"
      set -g pane-border-style "fg=#45475a"
    '';
  };
}
