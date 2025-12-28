if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    alias ls="ls --color=auto -A"
    alias grep="grep --color=auto"
    alias fastfetch-image="fastfetch -c ~/.config/fastfetch/config-image.jsonc"
    alias i-use-arch-btw="fastfetch -c ~/.config/fastfetch/config-image.jsonc --logo arch"
    alias wkill="hyprctl kill"
    alias neofetch="fastfetch -c neofetch"
    alias cmatrix-rainbow="cmatrix | lolcat"
end

function mkcd --description "Create a directory and cd into it"
    mkdir -p $argv[1] && cd $argv[1]
end
