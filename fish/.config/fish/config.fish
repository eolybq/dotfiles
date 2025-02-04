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

  set -gx FZF_DEFAULT_COMMAND fd --hidden --strip-cwd-prefix --exclude .git --exclude miniconda3 --exclude .cargo --exclude .cache
  set -gx FZF_DEFAULT_OPTS --tmux center

  # set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
  # set -gx FZF_ALT_C_COMMAND fd --type=d --hidden --strip-cwd-prefix --exclude .git
  
  # function show_file_or_dir_preview
  #   if test -d $argv[1]
  #       eza --tree --color=always $argv[1] | head -n 200
  #   else
  #       bat -n --color=always --line-range :500 $argv[1]
  #   end
  # end

  # set -gx FZF_CTRL_T_OPTS "--preview 'show_file_or_dir_preview {}'"
  # set -gx FZF_ALT_C_OPTS "--preview 'eza --tree --color=always {} | head -200'"
  

  # fzf.fish
  fzf_configure_bindings --directory=\ct --history= 

  set -x fzf_fd_opts --hidden --exclude .git --exclude miniconda3 --exclude .cargo --exclude .cache
  set -x fzf_preview_dir_cmd eza --tree --color=always | head -n 200
  set -x fzf_preview_file_cmd bat -n --color=always --line-range :500



  abbr -a ls eza --color=always --all --grid --long --git --no-filesize --icons=always --no-time --no-user --no-permissions
  abbr -a lt eza --color=always --all --tree --long --git --no-filesize --icons=always --no-time --no-user --no-permissions
  abbr -a code code --enable-features=UseOzonePlatform --ozone-platform=wayland
  abbr -a grep grep --color=auto
  abbr -a cat bat --color=always
  abbr -a nv nvim
  abbr -a lg lazygit
  abbr -a tx tmux


  # TIDE prompt config
  set -g tide_left_prompt_frame_enabled true
  set -g tide_left_prompt_items context $tide_left_prompt_items
  set -g tide_left_prompt_prefix " "

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
