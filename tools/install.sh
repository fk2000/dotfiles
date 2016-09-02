set -e

hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/koara-local/dotfiles.git ${HOME}/dotfiles || {
  echo "git not installed"
  exit
}
