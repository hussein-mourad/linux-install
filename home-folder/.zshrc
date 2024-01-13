# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.profile
export PATH=$HOME/.local/bin:$HOME/.bin:$HOME/bin:/usr/local/bin:/snap/bin/:$PATH

export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 # Usage examples:
 # nvm list-remote

export ZSH="$HOME/.oh-my-zsh"
 # Microsoft Edge cv_debug.log file fix
 #export TMPDIR="/tmp;microsoft-edge"
export TMPDIR="/tmp"

source /usr/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git;
antigen bundle command-not-found;

antigen bundle zsh-users/zsh-autosuggestions;
antigen bundle zsh-users/zsh-syntax-highlighting;
antigen bundle zsh-users/zsh-completions;
antigen bundle jeffreytse/zsh-vi-mode;

# antigen theme agnoster 
# antigen theme strug 
# antigen theme robbyrussell
antigen theme romkatv/powerlevel10k

antigen apply;
 

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="robbyrussell"
# ZSH_THEME="strug"
# ZSH_THEME="random"
# echo $RANDOM_THEME

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
  ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
 HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions zsh-vi-mode)
# plugins=(git zsh-completions zsh-vi-mode)
# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

IPADDR=$(hostname -I | awk '{print $1}')

# Example aliases
# alias rm="rm -ri"
alias zshc="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias i3c="vim ~/.config/i3/config"
alias i3blocksc="vim ~/.config/i3/i3blocks.conf"
alias vimc="vim ~/.vimrc"
#alias files="io.elementary.files"

if [ -x "$(command -v lsd)" ]; then
  alias ls="lsd"
  alias lt="lsd --tree"
fi
if [ -x "$(command -v dust)" ]; then
  alias du="dust"
fi
if [ -x "$(command -v duf)" ]; then
  alias df="duf"
fi
if [ -x "$(command -v bat)" ]; then
  #alias cat="bat"
fi

alias webdev="cd /mnt/d/vscode/webdev-challenges/Fullstack/"
alias java16="export JAVA_HOME=/home/hussein/Downloads/jdk-16.0.1/bin/;export PATH=$PATH:$JAVA_HOME"
alias vscp="cd /mnt/d/VSCodeProjects/"
alias nbp="cd /mnt/d/NetBeansProjects"
alias clp="cd /mnt/d/ClionProjects"
alias wsp="cd /mnt/d/WebstormProjects"
alias ideap="cd /mnt/d/IdeaProjects" 
alias ard="cd /mnt/d/Arduino/"
alias mia="cd /mnt/d/mia/"
alias backup="cd /mnt/d/Linux/Downloads/fresh_linux_install" 
alias work="/mnt/work"

# PATH alias
uni='/mnt/d/College/Term9'
alias uni="cd $uni"
export uni

# bash ~/Downloads/pfetch-0.6.0/pfetch

# Package manager
alias q='apt search'
alias i='sudo apt install'
alias u="sudo apt update && sudo apt upgrade -y && sudo snap refresh"
alias r='sudo apt remove'

# Fun
# figlet -t hussein
# colorscript random

# Nala
# autoload bashcompinit;
# bashcompinit;
# source /usr/share/bash-completion/completions/nala;

# Ros
# source /opt/ros/noetic/setup.zsh
# source $rbc22/robocon_ws/devel/setup.zsh
# source ~/ros/catkin_ws/devel/setup.zsh
# source ~/ros2_ws/install/setup.zsh
# source ~/ros_workspaces/catkin_ws/devel/setup.zsh



# Ros2
# source /opt/ros/foxy/setup.zsh
# source /usr/share/colcon_cd/function/colcon_cd.sh
# export _colcon_cd_root=/opt/ros/foxy/
# source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh
# export GPG_TTY=$(tty)

# Emscripten
# source ~/emsdk/emsdk_env.sh

#export EDITOR="code"
export EDITOR="vim"

# Remove Background colors
eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
