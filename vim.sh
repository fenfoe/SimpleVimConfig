#!/usr/bin/env bash

echo "=== Setting up Vim environment ==="

PLUG_VIM="$HOME/.vim/autoload/plug.vim"
if [ ! -f "$PLUG_VIM" ]; then
    echo "Installing vim-plug..."
    curl -fLo "$PLUG_VIM" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "vim-plug already installed."
fi

echo "Installing Vim plugins..."
vim +'PlugInstall --sync' +qa
echo "Plugins installed."

VIM_COLORS="$HOME/.vim/colors"
mkdir -p "$VIM_COLORS"
echo "Created ~/.vim/colors folder."

GRUVBOX="$VIM_COLORS/gruvbox.vim"
if [ ! -f "$GRUVBOX" ]; then
    echo "Downloading gruvbox colorscheme..."
    curl -fLo "$GRUVBOX" \
        https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
else
    echo "gruvbox.vim already exists."
fi

echo "=== Vim setup complete! ==="
