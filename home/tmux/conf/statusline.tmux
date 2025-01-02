# rose-pine colors
set -g @base "#191724"
set -g @surface "#1f1d2e"
set -g @overlay "#26233a"
set -g @muted "#6e6a86"
set -g @subtle "#908caa"
set -g @text "#e0def4"
set -g @love "#eb6f92"
set -g @gold "#f6c177"
set -g @rose "#ebbcba"
set -g @pine "#419abe"
set -g @foam "#9ccfd8"
set -g @iris "#c4a7e7"
set -g @highlight_low "#21202e"
set -g @highlight_med "#403d52"
set -g @highlight_high "#524f67"	

# intermediate vars for easy swapping
set -gF @command-fg "#{@foam}"
set -gF @status-fg "#{@iris}"
set -gF @current-win "#{@rose}"
set -gF @blank "#{@base}"
set -gF @separator "#{@overlay}"

# set styles (adapted from @pcheng17)
set -g status-style "bg=default fg=#{@status-fg}"
set -g status-left "#{?client_prefix,#[fg=#{@blank}]#[bg=#{@status-fg}],#[default]}   #S #[fg=#{@separator},bg=default]| "
set -g status-right "#[fg=#{@status-fg}]  %a, %b %d #[fg=#{@separator}]|#[fg=#{@status-fg}]  %-I:%M %p "
set -g window-status-current-style "fg=#{@current-win}"
set -g message-style "bg=default fg=#{@command-fg}"
set -g message-command-style "bg=default fg=#{@command-fg}"
set -g mode-style "bg=#{@separator} fg=#{@command-fg}"
set -g status-right-length 100
set -g status-left-length 100

