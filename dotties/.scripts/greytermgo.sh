#!/bin/bash


# Before anything install neovim version 10+

# Install kitty & oh-my-zsh echo "installing kitty & oh-my-zsh"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# # Install dependencies
echo "installing zsh & exa"
sudo apt install zsh
sudo apt install exa
chsh -s $(which zsh)

# # Create symbolic links for my shared settings
echo "creating symbolic links for shared files"
ln -s ~/.config/shared/nvim ~/.config
ln -s ~/.config/shared/kitty ~/.config
ln -s ~/.config/shared/tmux/.tmux.conf ~/
ln -s ~/.config/shared/dotties/.zshrc ~/
ln -s ~/.config/shared/dotties/.bash_aliases ~/
ln -s ~/.config/shared/dotties/.scripts ~/
ln -s ~/.config/shared/dotties/tmux ~/.tmux
ln -s ~/.config/shared/fonts ~/.fonts
ln -s ~/.config/shared/rg ~/.rg

# Clone tpm & cattpuccin for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins
tmux source ~/.tmux.conf
# in tmux run <leader>+i to install plugins

# # Kitty Icon - Probably not necassary, can possibly break
# # If mkdir .local/bin does not exist, create it
# if [ ! -f ~/.local/bin/ ]: then
#     mkdir ~/.local/bin/
#     
# ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# # Place the kitty.desktop file somewhere it can be found by the OS
# cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
# cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# # Update the paths to the kitty and its icon in the kitty desktop file(s)
# sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
# sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
# # Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
# echo 'kitty.desktop' > ~/.config/xdg-terminals.list
