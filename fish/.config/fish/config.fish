if status is-interactive
    # Commands to run in interactive sessions can go here
    
    set current_tty $(tty)

    if string match -q "/dev/pts*" (tty)
        starship init fish | source
    end

    alias fastfetch-image="fastfetch -c ~/.dotfiles/fastfetch/.config/fastfetch/config-image.jsonc"
    alias i-use-artix-btw="fastfetch -c ~/.dotfiles/fastfetch/.config//fastfetch/config-image.jsonc --logo artix"
    alias wkill="hyprctl kill"
    alias neofetch="fastfetch -c neofetch"
    alias cmatrix-rainbow="cmatrix | lolcat"
    alias ls="exa --icons=auto"
    alias gls="/usr/bin/ls"

    bat --completion fish | source
end

function mkcd --description "Create a directory and cd into it"
    mkdir -p $argv[1] && cd $argv[1]
end

function md --description "Create temp.html of the selected markdown file and open it in the browser"
    mkdir -p ~/.cache/md
    markdown $argv[1] > ~/.cache/md/temp.html
    firefox ~/.cache/md/temp.html
end

function on_exit --on-process %self 
    rm ~/.cache/md/temp.html
end

function 2webp --description "Any image to webp!"
    for anim in $1;
        ffmpeg "-i $anim -loop 0 $anim%.*.webp"
    end
end
