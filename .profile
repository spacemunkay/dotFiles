if [[ -s /Users/some_dude3/.rvm/scripts/rvm ]] ; then source /Users/some_dude3/.rvm/scripts/rvm ; fi

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/Users/some_dude3/workspace/flex_sdk_4.1.0.16076_mpl/bin

source ~/.aliases

#get Git information
source ~/.git-completion.sh
function parse_git_branch {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

#Set Bash to display coloring for files
export CLICOLOR=1
#Set the coloring scheme for ls
export LSCOLORS='Hxgxcxdxfxegcdabagacad'

#Set Bash Prompt Information and colors
PS1='[$(date +%H:%M) \[\033[0;36m\]\u \[\033[0;33m\]\w \[\033[0;31m\]$(__git_ps1 "(%s)")\[\033[0m\]]\$ '

[[ -s "/Users/some_dude3/.rvm/scripts/rvm" ]] && source "/Users/some_dude3/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
