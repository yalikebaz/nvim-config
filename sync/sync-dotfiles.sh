echo 'Copying zshrc file...'
cp ~/.zshrc ~/.config/nvim/sync/.zshrc_copy

echo 'Copying tmux.conf file...'
cp ~/.config/tmux/tmux.conf ~/.config/nvim/sync/tmux.conf_copy

echo 'Copying custom obsidian css file...'
cp ~/Documents/Obsidian/Zettelkasten/.obsidian/snippets/custom-css.css ~/.config/nvim/sync/obsidian.css

echo 'Copying .obsidian.vimrc...'
cp ~/Documents/Obsidian/Zettelkasten/.obsidian.vimrc ~/.config/nvim/sync/obsidian.vimrc

echo 'Copying kitty configuration...'
cp ~/.config/kitty/kitty.conf ~/.config/nvim/sync/kitty.conf

echo 'Copying homebrew packages...'
brew list > ~/.config/nvim/sync/brew_packages.md

echo 'done'
