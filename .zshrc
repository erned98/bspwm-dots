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

autoload -U colors && colors

# Adding some additional keybindings
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[3~' delete-char

# Tab completion
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:default' list-colors ma=0\;15

# What if the programme is not installed?
[[ -a "/etc/zsh_command_not_found" ]] && . /etc/zsh_command_not_found

# 
# ┌┬┐┌─┐┌─┐┌─┐┬ ┬┬ ┌┬┐┌─┐
#  ││├┤ ├┤ ├─┤│ ││  │ └─┐
# ─┴┘└─┘└  ┴ ┴└─┘┴─┘┴ └─┘
# 
if [[ $(tty) =~ /dev/tty ]]; then
    export BROWSER="w3m"
else
    export BROWSER="firefox"
fi

export EDITOR="vim"
export VISUAL="vim"
export SUDO_EDITOR="vim"
export DIFFPROG="colordiff"

# 
# ┌─┐┌─┐┌─┐┌┬┐┬ ┬┌─┐┌┬┐┬┌─┐┌─┐
# ├─┤├┤ └─┐ │ ├─┤├┤  │ ││  └─┐
# ┴ ┴└─┘└─┘ ┴ ┴ ┴└─┘ ┴ ┴└─┘└─┘
# 

# Enable colours
if [[ $(tty) =~ /dev/pts ]]; then
    command -v lsd > /dev/null && alias ls='lsd -lah --group-dirs first'
    command -v lsd > /dev/null && alias tree='lsd --tree'
    command -v bat > /dev/null && alias cat='echo && bat --theme=base16 --pager=never -p'
else
    alias ls='ls --color=auto -lah --group-directories-first'
fi

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

# Set a fancy prompt
case "$TERM" in
    xterm-color|xterm-kitty) color_prompt=yes;;
esac

PENGUIN=🐧

if [ "$color_prompt" = yes ]; then
    eval "$(starship init zsh)"
else
	PROMPT=$'\n[%D{%H:%M}] %B%F{white}%~\n%f%b> '
fi

# Start with a colourscript
if [ "$color_prompt" = yes ]; then
	colorscript -r
else
    setfont ter-232n
fi

# 
# ┌─┐┬  ┬┌─┐┌─┐┌─┐┌─┐
# ├─┤│  │├─┤└─┐├┤ └─┐
# ┴ ┴┴─┘┴┴ ┴└─┘└─┘└─┘
#

## Basic
alias ..='cd ..'
alias 2..='cd ../..'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'
alias 5..='cd ../../../../..'
alias h='cd ~'
alias df='df -h -x tmpfs'
alias du='du -h --max-depth=1 2> /dev/null | sort -h -r | head -n20'
alias free='free -h'
alias mkdir='mkdir -p'
alias wiki='wikiman -q'
alias q='exit'
alias rb='reboot'
alias pwr='shutdown -h'

## Dotfiles
alias rld='clear && source ~/.zshrc'
alias n='$EDITOR'
alias sn='sudoedit'
alias g.='cd ~/.config'
alias gc='git clone'
alias gcm='git commit -m'
alias shrc='$EDITOR ~/.zshrc'
alias wmrc='$EDITOR ~/.config/bspwm/bspwmrc'
alias sxrc='$EDITOR ~/.config/sxhkd/sxhkdrc'
alias pbrc='$EDITOR ~/.config/polybar/config.ini'
alias ktrc='$EDITOR ~/.config/kitty/kitty.conf'
alias drc='$EDITOR ~/.config/dunst/dunstrc'
alias strc='$EDITOR ~/.config/starship.toml'

## Productivity
alias rec='ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0 ~/Videos/Screencasts/rec-$(date +%y%m%d%H%M).mp4'
alias ping='ping -c 20'

## For the memes
alias fetch='echo && fastfetch'
alias clr='colorscript -e blocks1'
alias hello="notify-send 'Oh, hi! Nice to see you!' 'Remember to take regular breaks and drink water!' -i tux"
alias btw="notify-send 'i use arch btw' -i /usr/share/icons/Flat-Remix-Orange-Dark/status/scalable/512/distributor-logo-archlinux.svg"
alias pls='sudo $(fc -ln -1)'

## Scripts
alias bton='sh ~/Scripts/bton'
alias rsp='sh ~/Scripts/respice'
alias wttr='sh ~/Scripts/wttr'
alias newmonth='sh ~/Scripts/newmonth'
alias detox='sh ~/Scripts/dnsdetox'

## Archive extraction
function ex {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "ex: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

## Package management
# Pacman / Yay
alias s='yay -S'
alias syu='yay -Syu'
alias rn='yay -Rn'
alias rns='yay -Rns'
alias ss='yay -Ss'
alias pw='yay -Pw'
alias pww='yay -Pww'
alias Q='pacman -Q'
alias ql='pacman -Q | wc -l'
alias si='pacman -Si'
alias qdtq='yay -Rns $(pacman -Qdtq)'

## APT / Nala
# alias s='sudo nala install'
# alias syu='sudo nala upgrade'
# alias rn='sudo nala purge'
# alias rns='sudo nala purge --autoremove'
# alias ss='nala search'
# alias Q='apt list --installed | wc -l'
# alias qdtq='sudo nala autoremove --purge'


