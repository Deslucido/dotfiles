# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/.histfile
HISTSIZE=8000
SAVEHIST=8000
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
PROMPT='%B%F{#b43e46}%n@%m %F{white}⮚ %b%f '
autoload -Uz compinit
compinit
# End of lines added by compinstall



# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# Alias
alias p="sudo pacman"
alias act="bash ~/.configpersonal/.pacmancito && sudo pacman -Syu"
alias barra='f(){ killall -q polybar; polybar -c ~/.config/polybar/config/.statusbar "$@" & disown;  unset -f f; }; f'
alias kbarra='killall -q polybar'
alias sincronizar='sh ~/Documents/Git/dotfiles/sincronizar-dotfiles'

alias árbol="tree -CA"
alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff='diff --color=auto'


xr="$HOME/.Xresources"
zsh="$HOME/.zshrc"
kit="$HOME/.config/kitty/kitty.conf"
poly="$HOME/.config/polybar/config/.statusbar"
bsp="$HOME/.config/bspwm/bspwmrc"
sx="$HOME/.config/sxhkd/sxhkdrc"
na="$HOME/.nanorc"
mi="$HOME/.config/micro/settings.json"




#Otras cosillas
#kitty +kitten icat /home/deslucido/Desktop/jojohedoro.jpg


