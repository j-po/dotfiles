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

function vs {
  vim -S ~/.vim/sessions/$1
}

#FIXME: This doesn't work yet.
# complete -G '~/.vim/sessions/*.vim' vs

function pull-all {
  for i in `ls` ; do
    pushd $i
    git pull
    popd
  done
}

function update-vim-plugins {
  pushd ~/.vim/bundle
  pull-all
  popd
}

export GITSTACK=()
export GITSTASHCK=()

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
