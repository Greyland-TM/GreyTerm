#!/bin/bash
# The first thing you should do is install the following dependencies:
#	1: neovim version 10+
#	2: Node or nvm
#	3: python or pyenv
#
# Additional Notes:
# If everything installed successfully run "<leader>+i" from within tmux to install plugins

if [[ "$PWD" != "$HOME" ]]; then
 echo "Please start this script from your home directory."
 exit
fi

sudo apt upgrade; sudo apt update

# # Install zsh & tree-sitter
sudo apt install zsh exa cargo flatpak gdu 
hsh -s $(which zsh)
cargo install tree-sitter-cli
cargo install --git https://github.com/ClementTsang/bottom --locked

# Install kitty & oh-my-zsh
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Set the Kitty Icon
if [ ! -f ~/.local/bin/ ]; then
     mkdir ~/.local/bin/
fi
     
 ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
 # Place the kitty.desktop file somewhere it can be found by the OS
 cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
 # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
 cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
 # Update the paths to the kitty and its icon in the kitty desktop file(s)
 sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
 sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
 # Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
 echo 'kitty.desktop' > ~/.config/xdg-terminals.list

# # Create symbolic links for my shared settings
mv ~/.config/nvim ~/.config/nvim.gterm_bak; ln -s ~/.config/shared/nvim ~/.config
mv ~/.config/kitty ~/.config/kitty.gterm_bak; ln -s ~/.config/shared/kitty ~/.config
mv ~/.tmux.conf ~/.tmux.conf.gterm_bak; ln -s ~/.config/shared/tmux/.tmux.conf ~/
mv ~/.zshrc ~/.zshrc.gterm_bak; ln -s ~/.config/shared/dotties/.zshrc ~/
mv ~/.bash_aliases ~/.bash_aliases.gterm_bak; ln -s ~/.config/shared/dotties/.bash_aliases ~/
mv ~/.scripts ~/.scripts.gterm_bak; ln -s ~/.config/shared/dotties/.scripts ~/
mv ~/.tmux ~/.tmux.gterm_bak; ln -s ~/.config/shared/dotties/.tmux ~/.tmux
mv ~/tmux ~/tmux.gterm_bak; ln -s ~/.config/shared/tmux ~/tmux
mv ~/.fonts ~/.fonts.gterm_bak; ln -s ~/.config/shared/fonts ~/.fonts
mv ~/.rg ~/.rg.gterm_bak; ln -s ~/.config/shared/rg ~/.rg

# Clone tpm & cattpuccin for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
tmux source ~/.tmux.conf

# Install brew & dependencies for nvim
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ripgrep jesseduffield/lazygit/lazygit

# Install neovim from tar
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf ~/opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
