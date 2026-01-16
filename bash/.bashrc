#
# ~/.bashrc
#

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias fastfetch-image='fastfetch -c ~/.config/fastfetch/config-image.jsonc'
alias i-use-arch-btw='fastfetch -c ~/.config/fastfetch/config-image.jsonc --logo arch'
alias wkill='hyprctl kill'
alias neofetch='fastfetch -c neofetch'

current_tty=$(tty)

if [[ $current_tty == /dev/pts* ]] then
  eval "$(starship init bash)"
fi