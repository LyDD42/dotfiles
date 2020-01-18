# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vi="gvim -v"

# User specific environment and startup programs
export PATH="${HOME}/local/bin":$PATH

export LD_LIBRARY_PATH="$HOME/local/lib/boost:$HOME/local/lib:/usr/local/lib:$LD_LIBRARY_PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/LyDD/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/LyDD/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/LyDD/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/LyDD/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# activate conda
conda activate python3_7
