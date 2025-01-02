# set colorscheme
source $DOTDIR/fzf/colorschemes/rose-pine.sh

# add bindings
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--bind=tab:down,shift-tab:up
"

source $DOTDIR/fzf/aliases/cd.sh
source $DOTDIR/fzf/aliases/exef.sh
source $DOTDIR/fzf/aliases/nvim.sh
