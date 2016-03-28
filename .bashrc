source ~/.git-prompt.sh
PROMPT_COMMAND='__posh_git_ps1 "\e[1;32;2;44m \w\e[m" "\n\$ "'

#start program alias
alias np="notepad++.exe"
alias bfg="java -jar ~/bfg-1.12.8.jar"
alias iv="i_view32.exe"
alias pdf="AcroRd32.exe"

# Makes a more readable output.
alias du='du -khs * | sort -h | less'
alias df='df -kTh'

#Useful alias for navigating
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias hh='cd ~'
alias cs..='cs ..'
alias cd..='cd ..'
alias ls='ls --color -hL --group-directories-first --format=horizontal'
alias ll='ls -ahlL --color --group-directories-first'


# cd to folder macros
function cs () {
    cd "$@" && ls
    }
	
function gh(){
	cd ~/"Documents/GitHub/$@" && ls
}


# git macros
alias gs="git status -b $args"
alias gc="git commit -ev $args"
alias ga="git add --all $args"
alias gl="git log --graph --oneline --decorate $args"
alias gps="git push $args"
alias gpl="git pull $args"
alias gf="git fetch $args"
alias gck="git checkout $args"
alias gb="git branch $args"
alias gr="git remote -v $args"
