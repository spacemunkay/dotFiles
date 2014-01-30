source .aliases
#get Git information
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
function parse_git_branch {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}")"
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#Set Bash Prompt Information and colors
PS1='[$(date +%H:%M) \[\033[0;36m\]\u \[\033[0;33m\]\w \[\033[0;31m\]$(__git_ps1 "(%s)")\[\033[0m\]]\$ '
