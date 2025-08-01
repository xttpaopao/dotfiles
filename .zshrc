if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git
	zsh-autosuggestions
	docker
	docker-compose
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# >>> ros init >>>
source /opt/ros/noetic/setup.zsh
# <<< ros init <<<

# >>> nvim init >>> 
export PATH=$PATH:/home/xutao/Applications/squashfs-root/usr/bin/
# <<< nvim init <<<

# >>> mini conda init >>>
export PATH=$PATH:/home/xutao/miniconda3/bin/
# <<< mini conda init <<<

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/home/xutao/miniconda3/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/xutao/.local/share/mamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
# >>> claude code key
# export ANTHROPIC_AUTH_TOKEN=sk-qwtsLXE5Lm4VS0NS5rLpmpwJrlHhPVDfX0tXCMZ0wnIr2r2H
# export ANTHROPIC_BASE_URL=HTTPS://sg.uiuiapi.com
# <<< claude code key
# >>> kitty ssh >>>
alias kssh="kitty +kitten ssh"
# <<< kitty ssh <<<
