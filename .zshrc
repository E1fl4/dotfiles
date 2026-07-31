# Get pywal colors
# (cat ~/.cache/wal/sequences &)

# TTY prompt
if [[ "$TERM" == "linux" ]]; then
  PROMPT='%n@%m:%~$ '
  RPROMPT=''
  return
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export EDITOR='nvim'

alias wp="./Scripts/awww_randomize.sh Pictures/Wallpapers"
alias skipwp="./Scripts/skip_wallpaper.sh Pictures/Wallpapers &> /dev/null"
alias hf="hyfetch"
alias hfsize="hyprctl dispatch 'hl.dsp.window.resize({ x=1160, y=665 })' &> /dev/null && clear" # MesloLGMNFM-Regular (13pt)
# alias hfsize="hyprctl dispatch 'hl.dsp.window.resize({ x=897, y=540 })' &> /dev/null && clear" # MesloLGMNFM-Regular (11pt)
alias resize1="hyprctl dispatch 'hl.dsp.window.resize({ x=1, y=330 })' &> /dev/null && clear"
alias ff="fastfetch"
alias p="pipes-rs && clear"
alias m="cmatrix && clear"
alias cv="cava && clear"
alias bt="btop && clear"
alias s="systemctl poweroff"
alias c="clear"
