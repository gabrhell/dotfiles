# opções do zsh
setopt CORRECT
setopt NO_HUP
setopt NO_NOTIFY
setopt INTERACTIVE_COMMENTS

# teclas de atalho
bindkey -e
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3~" delete-char
bindkey "^H" backward-delete-word

# aliases
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -la'
alias bat='bat --theme=gruvbox-dark'
alias grep='grep --color=always'
alias sstcp='ss -lnt'
alias history='history 0'

# user programs environment
export PATH=~/.local/bin:$PATH
export EDITOR='nvim'
export VISUAL='nvim'

# zsh environment
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
PROMPT=$'%F{green}%f %F{green}%n%f %F{blue}%f %F{blue}%~%f\n%F{cyan}%f %F{cyan}zsh%f %F{blue}%f '
PROMPT_EOL_MARK=""
WORDCHARS=${WORDCHARS//\/}

function clearhist()
{
	local HISTSIZE=0;
	echo -n '' > ~/.histfile;
}
