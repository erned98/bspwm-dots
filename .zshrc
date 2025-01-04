# 
# 
#    ███████╗███████╗██╗  ██╗██████╗  ██████╗
#    ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#      ███╔╝ ███████╗███████║██████╔╝██║     
#     ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ██╗███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#                                            
# 

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/erne/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[3~' delete-char

# 
# ┌┬┐┌─┐┌─┐┌─┐┬ ┬┬ ┌┬┐┌─┐
#  ││├┤ ├┤ ├─┤│ ││  │ └─┐
# ─┴┘└─┘└  ┴ ┴└─┘┴─┘┴ └─┘
# 

export BROWSER="firefox"
export EDITOR="vim"
export VISUAL="vim"
export SUDO_EDITOR="vim"

# 
# ┌─┐┌─┐┌─┐┌┬┐┬ ┬┌─┐┌┬┐┬┌─┐┌─┐
# ├─┤├┤ └─┐ │ ├─┤├┤  │ ││  └─┐
# ┴ ┴└─┘└─┘ ┴ ┴ ┴└─┘ ┴ ┴└─┘└─┘
# 

# Enable colours
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pacman='pacman --color=auto'
alias qalc='qalc -c'

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export MANROFFOPT=-c

# Syntax highlighting and autosuggesting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set the colours
BLACK="\\[\\e[1;30m\\]"
RED="\\[\\e[1;31m\\]"
GREEN="\\[\\e[1;32m\\]"
YELLOW="\\[\\e[1;33m\\]"
BLUE="\\[\\e[1;34m\\]"
MAGENTA="\\[\\e[1;35m\\]"
CYAN="\\[\\e[1;36m\\]"
WHITE="\\[\\e[1;97m\\]"
YELLOWBG="\\[\\e[43m\\]"
REDBG="\\[\\e[101m\\]"
WHITEBG="\\[\\e[107m\\]"
RESET="\\[\\e[0m\\]"

# Set a fancy prompt
case "$TERM" in
    xterm-color|*256-color|xterm-kitty) color_prompt=yes;;
esac

PENGUIN=🐧

if [ "$color_prompt" = yes ]; then
	PS1=$'%{\n%B%F{magenta}%} %n%F{white} at %F{cyan} %m%F{white} in %F{yellow}  %~\n%F{white}  %b%f'
else
	PS1=$'\n[%D{%H:%M}] %B%F{white}%n%f%b at %B%F{white}%m%f%b in %B%F{white}%~\n%f%b> '
fi

# Start with a colourscript
if [ "$color_prompt" = yes ]; then
	colorscript -r
else
    setfont ter-u32n
fi

# 
# ┌─┐┬  ┬┌─┐┌─┐┌─┐┌─┐
# ├─┤│  │├─┤└─┐├┤ └─┐
# ┴ ┴┴─┘┴┴ ┴└─┘└─┘└─┘
#

# Basic
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias .....='cd ../../../../..'
alias h='cd ~'
alias ls='ls -lah --color=auto --group-directories-first'
alias df='df -h -x tmpfs'
alias free='free -h'
alias mkdir='mkdir -p'
alias ping='ping -c 20'
alias qalc='qalc -c'
alias q='exit'
alias rb='reboot'
alias pwr='shutdown -h'

# Dotfiles
alias rld='clear && source ~/.zshrc'
alias n='$EDITOR'
alias sn='sudoedit'
alias g.='cd ~/.config'
alias gc='git clone'
alias shrc='$EDITOR ~/.zshrc'
alias wmrc='$EDITOR ~/.config/bspwm/bspwmrc'
alias sxrc='$EDITOR ~/.config/sxhkd/sxhkdrc'
alias pbrc='$EDITOR ~/.config/polybar/config.ini'
alias ktrc='$EDITOR ~/.config/kitty/kitty.conf'
alias drc='$EDITOR ~/.config/dunst/dunstrc'

## For the memes
alias ff='echo && fastfetch'
alias hello="notify-send 'Oh, hi! Nice to see you!' 'Remember to take regular breaks and drink water!' -i tux"
alias btw="notify-send 'i use arch btw' -i /usr/share/icons/Flat-Remix-Orange-Dark/status/scalable/512/distributor-logo-archlinux.svg"
alias pls='sudo $(fc -ln -1)'

## Scripts
alias bton='sh ~/Scripts/bton'
alias rsp='sh ~/Scripts/respice'
alias wttr='sh ~/Scripts/wttr'
alias newmonth='sh ~/Scripts/newmonth'

## Package manager
# Pacman / Yay
alias s='yay -S'
alias syu='yay'
alias rn='yay -Rn'
alias rns='yay -Rns'
alias ss='yay -Ss'
alias Q='pacman -Q'
alias ql='pacman -Q | wc -l'
alias qdtq='yay -Rns $(pacman -Qdtq)'

## APT / Nala
# alias s='sudo nala install'
# alias syu='sudo nala upgrade'
# alias rn='sudo nala purge'
# alias rns='sudo nala purge --autoremove'
# alias ss='nala search'
# alias Q='apt list --installed | wc -l'
# alias qdtq='sudo nala autoremove --purge'

