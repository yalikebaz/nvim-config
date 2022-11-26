Lazygit isn't technically a nvim plugin, but I guess I find myself using it a lot in nvim,
so here's some things to remember.

# keybindings:
there's keybindings online: https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings
but there's still some useful stuff to remember

+ and -: change view
shift j/k: go up and down in the big panel
g: view reset options. reset soft stages your changes, while reset hard changes your files to match the commit. hard reset is similar to just dropping commit
space: stages a change
a: stages all changes
z: undo/go back

. and , can scroll pages in the panels

# config
In order to allow 'e' to edit the file in neovim from the lazygit window, go to the path: /Users/shahbazsiddiqui/Library/Application Support/lazygit/config.yml

and add this:
os:
  editCommand: "nvim"
