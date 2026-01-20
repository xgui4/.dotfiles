if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    alias fastfetch-image="fastfetch -c ~/.config/fastfetch/config-image.jsonc"
    alias i-use-arch-btw="fastfetch -c ~/.config/fastfetch/config-image.jsonc --logo arch"
    alias neofetch="fastfetch -c neofetch"
    alias edit="code-oss"
end

function mkcd --description "Create a directory and cd into it"
    mkdir -p $argv[1] && cd $argv[1]
end
