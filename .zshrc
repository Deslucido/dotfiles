# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
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

# Alias
alias árbol="tree -CA"
alias actualizar="bash ~/.configpersonal/.pacmancito && sudo pacman -Syu"
alias barra='f(){ killall -q polybar; polybar -c ~/.polybar/.statusbar "$@" & disown;  unset -f f; }; f'
alias kbarra='killall -q polybar'
alias nota='f(){ nano ~/Documents/Notas\ desorganizadas/\[NOTA\]\ "$@";  unset -f f; }; f'
alias porfa='sudo'


#Otras cosillas
#kitty +kitten icat /home/deslucido/Desktop/jojohedoro.jpg


