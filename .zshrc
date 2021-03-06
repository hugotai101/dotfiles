# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX=true
# Path to your oh-my-zsh installation.
[[ $TMUX != "" ]] && export TERM="screen-256color"
export LC_ALL=en_US.UTF-8
export ZSH="/Users/his/.oh-my-zsh"
fpath+=("$HOME/.oh-my-zsh/themes/pure")
autoload -U promptinit; promptinit
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
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
# DISABLE_MAGIC_FUNCTIONS=true

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode osx gpg-agent jsontools globalias)
#  

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# GPG settings
export NNN_OPENER=mpv
export NNN_PLUG='q:_qlmanage -p $nnn;o:_open $nnn;v:_nvim $nnn;u:_7z x $nnn'
export NNN_COLORS=4231

# remove vim edit mode delay to 10ms
KEYTIMEOUT=0
export PATH="/Applications/VMware Fusion.app/Contents/Public:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Library/Apple/bin:/Users/his/flutter/bin:$HOME/.pub-cache/bin:/Library/TeX/texbin"

eval "$(direnv hook zsh)"

function jobgit(){
    git config user.signingkey F7AC78E18BADD5F7005E76834E8D13646E9597A2
    git config user.name hypertai
    git config user.email hugo.tai101@gmail.com
}
alias v="nvim"
alias nv="nvim -u ~/.config/nvim/basic.vim"
# export EDITOR="nvim -u ~/.config/nvim/basic.vim"
export EDITOR="nvim"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias n=nnn

# Load pyenv automatically by appending
# the following to ~/.zshrc:

function fyp()
{
    oldpath=`pwd` cd ~/flutter.docset/Contents/Resources/Documents/doc
    python -m http.server &
    cd $oldpath
}
#
#  echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.zshrc
#
#For compilers to find llvm you may need to set:
#  export LDFLAGS="-L/usr/local/opt/llvm/lib"
#  export CPPFLAGS="-I/usr/local/opt/llvm/include"
NNN_ARCHIVE="\\.(7z|bz2|gz|tar|tgz|zip)$"
alias yt=youtube-dl
alias ff=ffmpeg
function uplevel()
{
    git -C $ZSH_CUSTOM/themes/powerlevel10k pull
}

function free()
{
   vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576)'
}
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/node@10/bin:$PATH"
NO_PROXY=localhost,127.0.0.1

# HSTR configuration - add this to ~/.zshrc
#alias h=hstr                     # h to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

 export PATH="$PATH:`pwd`/flutter/bin"


export SPARK_HOME="/Users/his/spark-2.4.5-bin-hadoop2.7/"
export PATH="$SPARK_HOME/bin:$PATH"
alias lg=lazygit



# Add .NET Core SDK tools
export PATH="$PATH:/usr/local/share/dotnet"
export PATH="$PATH:/Users/his/.dotnet/tools"
