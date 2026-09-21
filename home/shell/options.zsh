export WORDCHARS='*?_.[]~=&;!#$%^(){}<>'

HISTSIZE=50000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_dups
setopt hist_ignore_all_dups hist_save_no_dups hist_find_no_dups

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line
bindkey -r '\e'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':completion:*:default' list-colors \
    'di=1;36' 'ln=35' 'so=32' 'pi=33' 'ex=31' 'bd=34;46' 'cd=34;43' \
    'su=30;41' 'sg=30;46' 'tw=30;42' 'ow=30;43'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'
