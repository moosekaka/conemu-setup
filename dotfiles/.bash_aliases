# Interactive operation...
 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'

# Default to human readable figures
 alias du='du -khs * | sort -h | less'
 alias df='df -kTh'

# Misc :)
 alias less='less -r'                          # raw control characters
 alias whence='type -a'                        # where, of a sort
 alias grep='grep --color'                     # show differences in colour
 alias egrep='egrep --color=auto'              # show differences in colour
 alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
 alias ls='ls -hCF --color=tty'                 # classify files in colour
 alias dir='ls -d --color=auto --format=vertical */'
 alias vdir='ls --color=auto --format=long'
 alias l='ls -CF'                              #

#Useful alias for navigating
 alias ..='cd ..'
 alias ...='cd ../..'
 alias ....='cd ../../..'
 alias hh='cd ~'
 alias cs..='cs ..'
 alias cd..='cd ..'
 alias ls='ls --color -hLF --group-directories-first --format=horizontal'
 alias ll='ls -ahlL --color --group-directories-first'
 alias la='ls -a --color --group-directories-first'

#start program alias
alias np="notepad++.exe"
alias bfg="java -jar ~/bfg-1.12.8.jar"
alias iv="i_view32.exe"
alias pdf="AcroRd32.exe"
alias aa="Atom"

# git macros
alias ga="git add --all $args"
alias gb="git branch $args"
alias gc="git commit -ev $args"
alias gck="git checkout $args"
alias gd="git diff -p --stat"
alias gdc="git diff --cached"
alias gf="git fetch $args"
alias gl="git log --graph --oneline --decorate $args"
alias gpl="git pull $args"
alias gps="git push $args"
alias gr="git remote -v $args"
alias gs="git status -b $args"
