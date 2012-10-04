export TERM=xterm-256color
export EDITOR=gvim
for i in ~/.settings/*; do source $i;done
# export BNLPID=${$(netstat -atnp 2>/dev/null|grep '127.0.0.1:6166'|grep '0.0.0.0'|tr -s ' '|cut -d " " -f 7)/\/ssh/}
HISTFILE=~/.settings/.history
HISTSIZE=1000
SAVEHIST=2000
bindkey -e
eval `dircolors -b ~/.settings/.dircolors`
COMPLETION_WAITING_DOTS="true"
export GREP_OPTIONS='--color=always'
export GREP_COLORS="ms=00;38;5;157:mc=00;38;5;157:sl=:cx=:fn=00;38;5;74:ln=00;38;5;174:bn=00;38;5;174:se=00;38;5;174"
export PROMPT="%F{73}%h:%F{174}%C%f "
# export RPROMPT="%F{73}\$(kalan_vakit)\$(git_prompt)[\${PWD/\/home\/sselcuk/~}]%f"
export RPROMPT="%F{73}\$(kalan_vakit)[\${PWD/\/home\/sselcuk/~}]%f"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
export PATH=::~/.bin:$PATH
# export PATH=::~/.bin:$PATH:$HOME/.rvm/bin
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
autoload -U zmv
