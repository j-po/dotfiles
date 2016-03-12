#shopt -s globstar
export LEIN_FAST_TRAMPOLINE=y
alias lt='lein trampoline'

alias apt-get='sudo apt-get'
alias uu='apt-get update; apt-get upgrade; update-vim-plugins'

alias txa='tmux a -t'
alias txls='tmux ls'

alias gcm='git checkout master'
alias gbrh='git symbolic-ref --short HEAD`'
alias gca='git commit -a'
alias gph='git push origin `gbrh`'

alias vim='nvim'

alias psn='pushd > /dev/null'
alias ppn='popd > /dev/null'

function vs {
  vim -S ~/.vim/sessions/$1
}

#function _vsesh {
#COMPREPLY=`compgen -W (ls ~/.vim/session)`
#}

#FIXME: This doesn't work yet.
#complete -F _vsesh vs

function trimmed-remote-url {
  URL=`git remote get-url origin`
  if [[ "$URL" = "https://github.com/"* ]]; then
    URL="${URL#https://github.com/}"
    URL="${URL%.git}"
  elif [[ "$URL" = "git@github.com:"* ]]; then
    URL="${URL#git@github.com:}"
    URL="${URL%.git}"
  else
    exit 1
  fi
  echo $URL
  exit 0
}

function compare-upstream-hash {
  LOCAL_SHA="$(git rev-parse "refs/remotes/origin/`git symbolic-ref --short HEAD`")"
  UPSTREAM_SHA_HTTP_CODE="$(curl "https://api.github.com/repos/`trimmed-remote-url`/commits/master" \
  -H "Accept: application/vnd.github.chitauri-preview+sha" \
  -H "If-None-Match: \"$LOCAL_SHA\"")"

  if [[ $UPSTREAM_SHA_HTTP_CODE = "304" ]]; then
    exit 1
  else
    exit 0
  fi
}

function pull-all {
  for i in `ls` ; do
    psn $i
#    if `compare-upstream-hash`; then
      git pull
#    fi
    ppn
  done
}

function update-vim-plugins {
  pushd ~/.vim/bundle
  pull-all
  popd
  pushd ~/.config/nvim/nbundle
  pull-all
  popd
}

GITSTACK=()
GITSTASHCK=()

function pushb {
  export GITSTACK+=(`git symbolic-ref --short HEAD`)
  export GITSTASHCK+=(`git stash create`)
  git reset --hard
  git checkout $1
  echo ${GITSTACK[@]}
}

function popb {
  git checkout ${GITSTACK[-1]}
  unset ${GITSTACK[-1]}
  git stash apply ${GITSTASHCK[-1]}
  unset ${GITSTASHCK[-1]}
  echo ${GITSTACK[@]}
}

eval $(thefuck --alias) #Why doesn't this work?
