 export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
 export PATH=$HOME/bin:/usr/local/bin:$HOME/Downloads/platform-tools/:$HOME/.local/share/apache-maven-3.8.2/bin/:$JAVA_HOME/bin:/home/hussein/Downloads/apps/eagle-9.6.2/:$PATH
 source ~/.profile
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 export ZSH="/home/hussein/.oh-my-zsh"

 source /usr/share/antigen/antigen.zsh

 antigen use oh-my-zsh

 antigen bundle git;
 antigen bundle command-not-found;

 antigen bundle zsh-users/zsh-autosuggestions;
 antigen bundle zsh-users/zsh-syntax-highlighting;
 antigen bundle zsh-users/zsh-completions;
 antigen bundle jeffreytse/zsh-vi-mode;

 antigen theme strug

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
# Example aliases
# alias rm="rm -ri"
  alias zshc="vim ~/.zshrc"
  alias ohmyzsh="vim ~/.oh-my-zsh"
  alias i3c="vim ~/.config/i3/config"
  alias i3blocksc="vim ~/.config/i3/i3blocks.conf"
  alias vimc="vim ~/.vimrc"
  alias files="io.elementary.files"

  alias ls="lsd"
  alias lt="lsd --tree"
  alias cat="bat"
  alias du="dust"
  alias df="duf"

  alias uni="cd /mnt/f/College/Term5/"
  alias webdev="cd /mnt/d/vscode/webdev-challenges/Fullstack/"
  alias java16="export JAVA_HOME=/home/hussein/Downloads/jdk-16.0.1/bin/;export PATH=$PATH:$JAVA_HOME"
  alias vscp="cd /mnt/d/VSCodeProjects/"
  alias nbp="cd /mnt/d/NetBeansProjects"
  alias clp="cd /mnt/d/ClionProjects"
  alias wsp="cd /mnt/d/WebstormProjects"
  alias ideap="cd /mnt/d/IdeaProjects" 
  alias backup="cd /mnt/f/fresh_linux_install" 

# PATH alias
 export uni='/mnt/f/College/Term5'

 source /opt/ros/noetic/setup.zsh
 source ~/catkin_ws/devel/setup.zsh

 figlet -t hussein
# bash ~/Downloads/pfetch-0.6.0/pfetch
 source /opt/ros/noetic/setup.zsh
 source ~/catkin_ws/devel/setup.zsh
