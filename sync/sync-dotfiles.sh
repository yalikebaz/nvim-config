echo 'copying zshrc file...'
cp ~/.zshrc ~/.config/nvim/sync/.zshrc_copy
echo 'copying tmux.conf file...'
cp ~/.config/tmux/tmux.conf ~/.config/nvim/sync/tmux.conf_copy
echo 'copying custom obsidian css file...'
cp ~/Documents/Obsidian/Zettelkasten/.obsidian/snippets/custom-css.css ~/.config/nvim/sync/obsidian.css
echo 'done'
