#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(oh-my-posh init bash)"

alias fastfetch-image='fastfetch -c ~/.config/fastfetch/config-image.jsonc'
alias i-use-arch-btw='fastfetch -c ~/.config/fastfetch/config-image.jsonc --logo arch'
alias wkill='hyprctl kill'
alias neofetch='fastfetch -c neofetch'
