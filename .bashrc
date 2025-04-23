# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

export EDITOR=vim

# Path to your oh-my-bash installation.
export OSH='/home/jack/.oh-my-bash'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="zork"

# If you set OSH_THEME to "random", you can ignore themes you don't like.
# OMB_THEME_RANDOM_IGNORED=("powerbash10k" "wanelo")

# Uncomment the following line to use case-sensitive completion.
# OMB_CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# OMB_HYPHEN_SENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you don't want the repository to be considered dirty
# if there are untracked files.
# SCM_GIT_DISABLE_UNTRACKED_DIRTY="true"

# Uncomment the following line if you want to completely ignore the presence
# of untracked files in the repository.
# SCM_GIT_IGNORE_UNTRACKED="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.  One of the following values can
# be used to specify the timestamp format.
# * 'mm/dd/yyyy'     # mm/dd/yyyy + time
# * 'dd.mm.yyyy'     # dd.mm.yyyy + time
# * 'yyyy-mm-dd'     # yyyy-mm-dd + time
# * '[mm/dd/yyyy]'   # [mm/dd/yyyy] + [time] with colors
# * '[dd.mm.yyyy]'   # [dd.mm.yyyy] + [time] with colors
# * '[yyyy-mm-dd]'   # [yyyy-mm-dd] + [time] with colors
# If not set, the default value is 'yyyy-mm-dd'.
# HIST_STAMPS='yyyy-mm-dd'

# Uncomment the following line if you do not want OMB to overwrite the existing
# aliases by the default OMB aliases defined in lib/*.sh
# OMB_DEFAULT_ALIASES="check"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# To enable/disable display of Python virtualenv and condaenv
# OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
# OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format:
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"

# Function to search subcommands or options
search_sub() {
    local cmd="$1"

    # Check if the command is provided
    if [[ -z "$cmd" ]]; then
        echo "Usage: search-sub <command>"
        return 1
    fi

    # Check if the command exists
    if ! command -v "$cmd" &>/dev/null; then
        echo "Error: Command '$cmd' not found."
        return 1
    fi

    # Use compgen to get completions for the command
    local completions
    completions=$(compgen -A command "${cmd}" | grep "^${cmd}")

    # Check if completions were found
    if [[ -z "$completions" ]]; then
        echo "No subcommands found for '$cmd'."
        return 1
    fi

    # List subcommands
    echo "Subcommands for '$cmd':"
    echo "$completions"
}

red_text() {
    echo -e "\033[31m$1\033[0m"
}

alias run-launcher="sudo python3 ~/Documents/just-another-launcher/main.py"
alias run-awserver="sudo aw-server"
alias search-sub=search_sub
alias red_text=red_text
alias ask="bash ~/Documents/StartupScripts/ask.sh"

z-l() {
    z "$1" && ls -d */ && z -
}

z-t() {
    z "$1" && tree -L 1 && z -
}

alias zz='zoxide'
alias zq='zoxide query'
alias zb='zoxide add'
alias zl=z-l
alias zt=z-t
alias rmt='trash'
alias acp='scripts/push_operation.sh'

# Created by `pipx` on 2024-12-12 03:12:53
export PATH="$PATH:/home/jack/.local/bin"

eval "$(zoxide init bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

# echo 0 | sudo sysctl -w kernel.perf_event_paranoid=0

export PATH=$PATH:$HOME/google-cloud-sdk/bin
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export DOCKER_HOST=unix:///var/run/docker.sock
export EDITOR="nvim"

alias obsidian='obsidian && ~/Documents/Scripts/scripts_obsidian.sh'

source /home/jack/.config/broot/launcher/bash/br

cppBenchmark() {
    local cppFilePath=$(realpath $1)

    # Check to see if the path exists, terminate if not found
    if [[ ! -f $cppFilePath ]]; then
        echo "The path that you provided cannot be found."
        return 1
    fi

    local cppBaseName
    cppBaseName=$(basename "$cppFilePath" .cpp)

    g++ -O2 \
        -I/usr/include/benchmark/include \
        $cppFilePath \
        -L/usr/include/benchmark/build/src \
        -lbenchmark -lpthread \
        -o ${cppBaseName}.exe \
    || return 1

    # Execute the executable produced
    "./${cppBaseName}.exe"
}

pyBenchmark() {
    local pyFilePath=$(realpath $1)

    if [[ ! -r $pyFilePath ]]; then
        echo "The path to the file cannot be found."
        return 1
    fi

    kernprof -l -v $pyFilePath
}

pyFlameGraph() {
    local pyFilePath=$(realpath $1)

    if [[ ! -r $pyFilePath ]]; then
        echo "The path to the file cannot be found."
        return 1
    fi
    
    py-spy record   --output astar.flame.svg   --format flamegraph   -- python $pyFilePath
}

datamash() {
    # Compute 10th, 50th, 90th percentiles, plus mean, min, max, sum:
    datamash p 10 p 50 p 90 mean min max sum < times.txt
}

# alias hyperfine=hyperfine -w 3 -r 20 "perf stat -e instructions -- python3 test.py"

# in your shell (or at top of your script):
# export TIMEFORMAT='%3U user, %3S sys, %10.9R real'
export TIMEFORMAT='%9lR'

alias jira=~/OneDrive/Documents/Scripts/open_jira.sh
