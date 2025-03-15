# User specific environment and startup programs
export PATH="${HOME}/.local/bin":$PATH
# add pycharm in PATH
export PATH="$HOME/opt/pycharm/bin":$PATH

export PYTHONPATH="/home/lydd/local/lib64/python3.7"

export LD_LIBRARY_PATH="$HOME/local/lib/boost:$HOME/local/lib:/usr/local/lib:$LD_LIBRARY_PATH"

export HOST=$(hostname)

export EDITOR=nvim

#FZF
# export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
