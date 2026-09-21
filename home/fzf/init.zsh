# set colorscheme
source "$XDG_CONFIG_HOME/fzf/colorschemes/carbonfox.sh"

# add bindings
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--bind=tab:down,shift-tab:up
"

source "$XDG_CONFIG_HOME/fzf/aliases/cd.sh"
source "$XDG_CONFIG_HOME/fzf/aliases/exef.sh"
source "$XDG_CONFIG_HOME/fzf/aliases/nvim.sh"
