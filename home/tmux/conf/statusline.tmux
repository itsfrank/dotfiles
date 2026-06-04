# cafbonfox based
set -g @black   "#282828" # color0
set -g @yellow  "#08bdba" # color3
set -g @magenta "#be95ff" # color5
set -g @cyan    "#33b1ff" # color6
set -g @gray    "#484848" # color8

# UI roles
set -gF @command-fg "#{@yellow}"
set -gF @status-fg "#{@magenta}"
set -gF @current-win "#{@yellow}"
set -gF @blank "#{@black}"
set -gF @separator "#{@gray}"

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

