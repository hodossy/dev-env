echo "Set up tmux..."

if [ ! -e ~/.tmucx.conf ]; then
  ln -s `pwd`/.tmux.conf ~/.tmux.conf
fi

# clone tpm if needed
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

~/.tmux/plugins/tpm/bin/install_plugins
