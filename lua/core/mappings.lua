-- Save key strokes (now we do not need to press shift to enter command mode).
-- Vim-sneak has also mapped `;`, so using the below mapping will break the map
-- used by vim-sneak
local map = vim.keymap.set

map('n', '<leader>a', ':<C-U>NvimTreeToggle<CR>', {silent=true})

map({'x', 'n'}, ';', ':')
map({'x', 'n'}, ':', ';')

-- Quicker way to open command window
map('n', 'q;', 'q:')

-- Turn the word under cursor to upper case
map('i', '<c-u>', '<Esc>viwUea')

-- Turn the current word into title case
map('i', '<c-t>', '<Esc>b~lea')

-- Paste non-linewise text above or below current cursor,
-- see https://stackoverflow.com/a/1346777/6064933
map('n', '<leader>p', 'm`o<ESC>p``')
map('n', '<leader>P', 'm`O<ESC>p``')

-- Shortcut for faster save and quit
map('n', '<leader>w', ':<C-U>update<CR>', {silent=true})
-- Saves the file if modified and quit
map('n', '<leader>q', ':<C-U>x<CR>', {silent=true})
-- Quit all opened buffers
map('n', '<leader>Q', ':<C-U>qa!<CR>', {silent=true})

-- Navigation in the location and quickfix list
map('n', '[l', ':<C-U>lprevious<CR>zv', {silent=true}) -- The CTRL-U is used to remove the range that Vim may insert.
map('n', ']l', ':<C-U>lnext<CR>zv', {silent=true})
map('n', '[L', ':<C-U>lfirst<CR>zv', {silent=true})
map('n', ']L', ':<C-U>llast<CR>zv', {silent=true})
map('n', '[e', ':<C-U>cprevious<CR>zv', {silent=true})
map('n', ']e', ':<C-U>cnext<CR>zv', {silent=true})
map('n', '[e', ':<C-U>cfirst<CR>zv', {silent=true})
map('n', ']e', ':<C-U>clast<CR>zv', {silent=true})

-- Close location list or quickfix list if they are present,
-- see https://superuser.com/q/355325/736190
-- nnoremap<silent> \x :<C-U>windo lclose <bar> cclose<CR>

-- Close a buffer and switching to another buffer, do not close the
-- window, see https://stackoverflow.com/q/4465095/6064933
map('n', [[\q]], ':<C-U>bprevious <bar> bdelete #<CR>', {silent=true})

-- Insert a blank line below or above current line (do not move the cursor),
-- see https://stackoverflow.com/a/16136133/6064933
map('n', '<leader>o', function ()
  return string.format('m`%so<ESC>``', vim.v.count1)
end, {expr=true})

map('n', '<leader>O', function ()
  return string.format('m`%sO<ESC>``', vim.v.count1)
end, {expr=true})

-- Insert a space after current character
map('n', '<Space><Space>', 'a<Space><ESC>h')

-- Move the cursor based on physical lines, not the actual lines.
map('n', 'j', function ()
  return (vim.v.count == 0 and 'gj' or 'j')
end, {expr=true})

map('n', 'k', function ()
  return (vim.v.count == 0 and 'gk' or 'k')
end, {expr=true})
-- nnoremap ^ g^
-- nnoremap 0 g0

-- Do not include white space characters when using $ in visual mode,
-- see https://vi.stackexchange.com/q/12607/15292
map('x', '$', 'g_')

-- Jump to matching pairs easily in normal mode
map('n', '<Tab>', '%')

-- Go to start or end of line easier
map({'n', 'x'}, 'H', '^')
map({'n', 'x'}, 'L', 'g_')

-- Continuous visual shifting (does not exit Visual mode), `gv` means
-- to reselect previous visual area, see https://superuser.com/q/310417/736190
map('x', '<', '<gv')
map('x', '>', '>gv')

-- When completion menu is shown, use <cr> to select an item and do not add an
-- annoying newline. Otherwise, <enter> is what it is. For more info , see
-- https://superuser.com/a/941082/736190 and
-- https://unix.stackexchange.com/q/162528/221410
-- inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<cr>"))
-- Use <esc> to close auto-completion menu
-- inoremap <expr> <esc> ((pumvisible())?("\<C-e>"):("\<esc>"))

-- Tab-complete, see https://vi.stackexchange.com/q/19675/15292.

-- use another way, NEED MORE WORK!
-- inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
-- inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

-- Edit and reload init.vim quickly
map('n', '<leader>ev', ':<C-U>tabnew $MYVIMRC | tcd %:h<CR>', {silent=true})
map('n', '<leader>rv', '<C-U>silent update $MYVIMRC | source $MYVIMRC<CR>')

-- Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
map('n', '<leader>v', function ()
  return string.format('`[%s`]', vim.fn.getregtype()[0])
end, {expr=true})

-- Search in selected region
map('x', '/', [[:<C-U>call feedkeys('/\%>'.(line("'<")-1).'l\%<'.(line("'>")+1)."l")<CR>]])

-- Find and replace (like Sublime Text 3)
map('n', '<C-H>', ':%s/')
map('x', '<C-H>', ':s/')

-- Use Esc to quit builtin terminal
map('t', '<ESC>', [[<C-\><C-n>]])

-- Change text without putting it into the vim register,
-- see https://stackoverflow.com/q/54255/6064933
map('n', 'c', '"_c')
map('n', 'C', '"_C')
map('n', 'cc', '"_cc')
map('x', 'c', '"_c')

-- Remove trailing whitespace characters
map('n', '<leader>d<Space>', ':<C-U>StripTrailingWhitespace<CR>')

-- check the syntax group of current cursor position
map('n', '<leader>st', ':<C-U>call utils#SynGroup()<CR>')

-- Copy entire buffer.
map('n', '<leader>y', ':<C-U>%y<CR>')

-- Toggle cursor column
map('n', '<leader>cl', ':<C-U>call utils#ToggleCursorCol()<CR>')

-- Move current line up and down
map('n', '<leader>k', ":<C-U>call utils#SwitchLine(line('.'), 'up')<CR>")
map('n', '<leader>j', ":<C-U>call utils#SwitchLine(line('.'), 'down')<CR>")

-- Move current visual-line selection up and down
map('x', '<leader>k', ":<C-U>call utils#MoveSelection('up')<CR>")
map('x', '<leader>j', ":<C-U>call utils#MoveSelection('down')<CR>")

-- Replace visual selection with text in register, but not contaminate the
-- register, see also https://stackoverflow.com/q/10723700/6064933.
map('x', 'p', '"_c<ESC>p')

map('n', 'gb', ":<C-U>call buf_utils#GotoBuffer(v:count, 'forward')<CR>")
map('n', 'gB', ":<C-U>call buf_utils#GotoBuffer(v:count, 'backward')<CR>")

map('n', '<Left>', '<C-W>h')
map('n', '<Right>', '<C-W>l')
map('n', '<Up>', '<C-W>k')
map('n', '<Down>', '<C-W>j')

-- Text objects for URL
map({'x', 'o'}, 'iu', ':<C-U>call text_obj#URL()<CR>')

-- Text objects for entire buffer
map({'x', 'o'}, 'iB', ':<C-U>call text_obj#Buffer()<CR>')

-- Do not move my cursor when joining lines.
map('n', 'J', 'mzJ`z')

-- insert semicolon in the end
map('i', '<A-;>', '<ESC>miA;<ESC>`ii')

-- Keep cursor position after yanking
map({'n', 'x'}, 'y', 'myy')

