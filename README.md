This folder is the remote origin for my config repository
The zshrc_lazygit folder contains config for my nvim, and a copy of my .zshrc

Run the script inside "zshrc_lazygit" to make a copy of my .zshrc here

Current issues with my vim config:
- All lsp errors are prefaced with 'typescript' for some reason
- Commenting doesn't work in tsx
  - I dont think its comments, i think its treesitter or lsp not detecting tsx (hunch is lsp because im getting highlighting)... 
  because if you look at an input tag in tsx you will see that the attributes are not italicized like they are in jsx...
- I wasn't seeing the warning that I usually see in VSCode for images needing an alt tag
