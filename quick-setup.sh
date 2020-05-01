#if ! hash brew 2>/dev/null; then
#  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#fi
#
#brew install leiningen
#brew install neovim/neovim/neovim
#
#if ! hash pip 2>/dev/null; then
#  python -c "$(curl -fsSL https://bootstrap.pypa.io/get-pip.py)"
#fi
#
#pip install --user neovim
#ln -s .nvimrc ~/.config/nvim/init.vim
#alias vim='nvim'

echo '{:user {:plugins [[cider/cider-nrepl "0.13.0"]]}}' >> ~/.lein/profiles.clj

tpope () {
  echo "Installing some vim plugins by Tim Pope. Yes, he gets his own function--it's the least I could do."
  pushd ~/.config/nvim/bundle 
  for a in $*; do
    git clone https://github.com/tpope/vim-$a
  done
  popd
}

tpope fireplace sexp-mappings-for-regular-people surround repeat classpath obsession

echo "Installing some other vim plugins."
pushd ~/.config/nvim/bundle
for a in ("guns/vim-sexp", "luochen1990/rainbow"); do
  git clone https://github.com/$a
done
popd
