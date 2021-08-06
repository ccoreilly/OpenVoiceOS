export TERM=xterm-xfree86
export LC_ALL=ca_ES.UTF-8
export LANG=ca_ES.UTF-8

if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi
