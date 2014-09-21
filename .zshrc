# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias antlr4='java -jar /usr/local/lib/antlr-4.1-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
alias ocaml='ledit ocaml'
alias sml='ledit sml'
alias junit='java org.junit.runner.JUnitCore'
alias ssh-robobrain-www-prod='ssh -i ~/Dev/PR-Research/robobrain/www.pem ec2-54-218-14-187.us-west-2.compute.amazonaws.com -l deedy'
alias ssh-robobrain-www-test='ssh -i ~/Dev/PR-Research/robobrain/www.pem ec2-54-218-20-10.us-west-2.compute.amazonaws.com -l deedy'
alias ssh-robobrain-mongo-prod='ssh -i ~/Dev/PR-Research/robobrain/mongo-prod.pem ec2-54-186-129-44.us-west-2.compute.amazonaws.com -l ec2-user'
alias ssh-robobrain-mongo-test='ssh -i ~/Dev/PR-Research/robobrain/mongo-test.pem ec2-54-186-47-107.us-west-2.compute.amazonaws.com -l ec2-user'
# alias matlab='matlab -nodesktop'

# Setting history settings
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Enable Command Line Interface Colors
export CLICOLORS=1

# Custom Solarized-esque 'ls' colors
export LSCOLORS="gxfxbEaEBxxEhEhBaDaCaD"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse ant)
plugins=(git zsh-syntax-highlighting ant brew python sublime)

source $ZSH/oh-my-zsh.sh

# Shortcuts
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Handy Extract Program.
function extract() {
          if [ -f $1 ] ; then
             case $1 in
              *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Handy Java Compiler and Runner
run-java() {
# Sanity Check
if [ $# -lt 1 ]
then
echo "Input at least one java file to be compiled"
fi

# Compile
var=$1
if [ -e $var ]
then
filename=$(basename "$var")
extension="${filename##*.}"
#echo $extension
if [ "$extension" = "java" ]
then
        echo "Compiling "$java"..."
        javac $var
fi
else
echo "Could not find the file "$var
fi
echo "Compilation completed."

# Execute
if [ -e $var ]
then
filename=$(basename "$var")
extension="${filename##*.}"
filename="${filename%.*}"
if [ "$extension" = "java" ]
then
        echo -e "Executing "$filename" with arguments '${@:2}'...\n"
        java $filename "${@:2}"
fi
fi
echo -e "\nCompleted."
}


# Customize to your needs...
# Use anaconda python first
export PATH=/Users/deedy/anaconda/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/Users/deedy/Dev/play-2.2.0
export PATH=$PATH:/Library/Ruby/Gems/2.0.0/gems
export PATH=$PATH:/Applications/MATLAB_R2013a.app/bin
export PATH=$PATH:/usr/local/rvm/bin

export MALTPARSERHOME=/Users/deedy/nltk_data
# ClassPath modified to include ANTLR4
export CLASSPATH=${CLASSPATH}:.:/usr/local/lib/antlr-4.1-complete.jar
export CLASSPATH=${CLASSPATH}:/usr/local/lib/junit-4.11.jar:/usr/local/lib/hamcrest-core-1.3.jar

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
