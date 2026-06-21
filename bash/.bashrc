# shellcheck disable=SC2148
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

current_tty=$(tty)

if [[ $current_tty == /dev/pts* ]]; then
  eval "$(starship init bash)"
fi

alias fastfetch-image="fastfetch -c ~/.dotfiles/fastfetch/.config/fastfetch/config-image.jsonc"
alias i-use-artix-btw="fastfetch -c ~/.dotfiles/fastfetch/.config//fastfetch/config-image.jsonc --logo artix"
alias wkill="hyprctl kill"
alias neofetch="fastfetch -c neofetch"
alias cmatrix-rainbow="cmatrix | lolcat"
alias ls="exa --icons=auto"
alias gls="/usr/bin/ls"
alias gfind=/usr/bin/find

eval "$(bat --completion bash)"

# ABOUT : Create temp.html of the selected markdown file and open it in the browser
function md () {
  mkdir -p ~/.cache/md
  markdown "$1" > ~/.cache/md/temp.html
  firefox ~/.cache/md/temp.html
}