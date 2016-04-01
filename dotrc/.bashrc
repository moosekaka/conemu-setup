LESS=-fRMQW-5
export LESS

#autocd
shopt -s autocd

# Don't wait for job termination notification
 set -o notify

# Use case-insensitive filename globbing
 shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
 shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
 shopt -s cdspell

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#dircolors
if [ -f "$HOME/.dir_colors" ] ; then
        eval $(dircolors -b $HOME/.dir_colors)
fi

# Import user functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

#prompt options

MAGENTA="\e[0;35m"
GREEN="\e[0;32m"
RESET="\e[m"
source ~/.git-prompt.sh
PROMPT_COMMAND='__posh_git_ps1 "${MAGENTA}\D{%a, %b %d %R}: ${GREEN}\w${RESET}" "\n${GREEN}\$ ${RESET}"'

# History Options

# Don't put duplicate lines in the history.
 export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
 export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
 export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Save timestamp in the history file
HISTTIMEFORMAT="%d/%m/%y %T "
HISTSIZE=20000
# Whenever displaying the prompt, write the previous line to disk
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
