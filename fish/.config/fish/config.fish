if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    alias fastfetch-image="fastfetch -c ~/.dotfiles/fastfetch/.config/fastfetch/config-image.jsonc"
    alias i-use-arch-btw="fastfetch -c ~/.dotfiles/fastfetch/.config//fastfetch/config-image.jsonc --logo arch"
    alias wkill="hyprctl kill"
    alias neofetch="fastfetch -c neofetch"
    alias cmatrix-rainbow="cmatrix | lolcat"
    alias cat="bat"
    alias gcat="/usr/bin/cat"
    alias ls="exa --icons=auto"
    alias gls="/usr/bin/ls"
    alias grep="ugrep"
    alias ggrep="/usr/bin/grep"
    alias icat="kitty +kitten icat"

    bat --completion fish | source
end

function mkcd --description "Create a directory and cd into it"
    mkdir -p $argv[1] && cd $argv[1]
end
