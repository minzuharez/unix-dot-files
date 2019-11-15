
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

export LC_CTYPE=en_GB.UTF-8
export LC_ALL=C
# export PS1="\[\e[00;33m\]\u\[\e[0m\]\[\e[00;37m\]@\h:\[\e[0m\]\[\e[00;36m\][\w]\[\e[0m\]\[\e[00;37m\]> \[\e[0m\]"
# export PS1="\[\e[0m\]\[\e[00;36m\][\w]\[\e[0m\]\[\e[00;37m\]> \[\e[0m\]"
export SVN_EDITOR=/usr/bin/vim
#export NCI_LOG_AT=notice
alias ll="ls -lart"

# PS1 
function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;36m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch=`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`
    # local __git_branch=`git branch`
    local __prompt_tail="\[\033[35m\]\n$"
    local __last_color="\[\033[00m\]"
    #export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
    export PS1="$__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
export -f show_virtual_env
PS1='$(show_virtual_env) '$PS1



# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/imac02/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    \eval "$__conda_setup"
#else
#    if [ -f "/Users/imac02/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/imac02/anaconda3/etc/profile.d/conda.sh"
#        CONDA_CHANGEPS1=false conda activate base
#    else
#        \export PATH="/Users/imac02/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda init <<<
