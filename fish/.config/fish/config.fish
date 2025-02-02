if status is-interactive
    # Commands to run in interactive sessions can go here


  function fish_greeting
      set capitalized (string sub -l 1 $USER | string upper)(string sub -s 2 $USER)
  
      echo "  ___"
      echo " |[_]|"
      echo " |+ ;|  ✦ "(set_color cyan)"Welcome to fish, the friendly interactive shell, "(set_color yellow)"$capitalized!"(set_color normal)"✦ "
      echo " `---'"
  end


  if not type -q fisher
    curl -sL https://git.io/fisher | fish
  end


  bind \e\[3\;5~ kill-word


  function y
  	set tmp (mktemp -t "yazi-cwd.XXXXXX")
  	yazi $argv --cwd-file="$tmp"
  	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
  		builtin cd -- "$cwd"
  	end
  	rm -f -- "$tmp"
  end


  zoxide init --cmd Z fish | source


  # fzf --fish | source
  fzf_configure_bindings --directory=\ct --history= 

  set fzf_fd_opts --hidden --exclude .git --max-depth 5
  set fzf_preview_dir_cmd eza --all --color=always


  abbr -a ls eza --color=always --all --grid --long --git --no-filesize --icons=always --no-time --no-user --no-permissions
  abbr -a code code --enable-features=UseOzonePlatform --ozone-platform=wayland
  abbr -a grep grep --color=auto
  abbr -a nv nvim


end


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/vasek/miniconda3/bin/conda
    status is-interactive && eval /home/vasek/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/vasek/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/vasek/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/vasek/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<


set -x HYPRLAND_CONFIG $HOME/.config/hypr/hyprland.conf
set -x PATH $HOME/.local/bin $PATH
set -x PATH $PATH /usr/bin
set -x EDITOR nvim
