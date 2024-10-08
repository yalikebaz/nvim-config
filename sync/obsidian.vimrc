" ######################## CORE ########################
" Yank to system clipboard
set clipboard=unnamed

" Setting space as leader
unmap <Space> 

" Quickly remove search highlights
nmap <Space>uh :nohl

imap jk <Esc>
imap kj <Esc>

" Surround
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

map [[ :surround_wiki
nunmap S
vunmap S
map S" :surround_double_quotes
map S` :surround_backticks
map S' :surround_single_quotes
map Sb :surround_brackets
map S( :surround_brackets
map S) :surround_brackets
map S[ :surround_square_brackets
map S[ :surround_square_brackets
map S{ :surround_curly_brackets
map S} :surround_curly_brackets

" ######################## Control mappings ########################
" Maps pasteinto to control
map <C-p> :pasteinto
" When pasting over a highlighted item, keeps the original pasted item in clipboard
vmap p "_dP 

" exmap toggleEditMode obcommand markdown:toggle-preview
" nmap <Tab> :toggleEditMode

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward

" Tab switching. Requires Cycle Through Panes Plugins https://obsidian.md/plugins?id=cycle-through-panes
exmap tabnext obcommand workspace:next-tab 
nmap L :tabnext

exmap tabprev obcommand workspace:previous-tab 
nmap H :tabprev

exmap toggleLeftSidebar obcommand app:toggle-left-sidebar
nmap <Space>e :toggleLeftSidebar

exmap toggleRightSidebar obcommand app:toggle-right-sidebar
nmap <Space>r :toggleRightSidebar

" ######################## Emulating whichkey manually #######################

" Base
exmap moveFile obcommand file-explorer:move-file
nmap <Space>M :moveFile

exmap togglePin obcommand workspace:toggle-pin
nmap <Space>p :togglePin

exmap deleteFile obcommand app:delete-file
nmap <Space>D :deleteFile

exmap vsplit obcommand workspace:split-vertical
nmap <Space>v :vsplit

exmap tabclose obcommand workspace:close
nmap <Space>c :tabclose
nmap <Space>q :tabclose

exmap tabreopen obcommand workspace:undo-close-pane
nmap <Space>z tabreopen

exmap newnote obcommand templater-obsidian:create-new-note-from-template
nmap <Space>n :newnote

" <Esc> or Tab to exit explorer
" exmap gofileexplorer obcommand file-explorer:open
" nmap <Space>e :gofileexplorer

" z: Folding
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nmap zM :foldall

" o: Obsidian control
" Trigger reload to apply any changes from this file
exmap reload obcommand app:reload 
nmap <Space>or :reload

nmap <Space>oo :obcommand

" g: Go ...
exmap gotolink obcommand editor:follow-link
nmap gd :gotolink

exmap goHome obcommand homepage:open-homepage
nmap gh :goHome

" s: search
exmap findtext obcommand global-search:open
nmap <Space>fF :findtext

exmap findfiles obcommand switcher:open
nmap <Space>ff :findfiles

exmap revealActiveFile obcommand file-explorer:reveal-active-file
nmap <Space>fl :revealActiveFile
