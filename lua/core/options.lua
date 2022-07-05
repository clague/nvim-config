local opt = vim.opt

local function t(str)
  -- Adjust boolean arguments as needed
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- change fillchars for folding, vertical split, end of buffer, and message separator
opt.fillchars=[[msgsep:‾]]

-- Paste mode toggle, it seems that Nvim's bracketed paste mode
-- does not work very well for nvim-qt, so we use good-old paste mode
opt.pastetoggle=t'<F12>'

-- Split window below/right when creating horizontal/vertical windows
opt.splitbelow=true 
opt.splitright=true

-- Time in milliseconds to wait for a mapped sequence to complete,
-- see https://unix.stackexchange.com/q/36882/221410 for more info
opt.timeoutlen=500

opt.updatetime=500  -- For CursorHold events

-- Clipboard settings, always use clipboard for all delete, yank, change, put
-- operation, see https://stackoverflow.com/q/30691466/6064933
opt.clipboard:append('unnamedplus')

-- Disable creating swapfiles, see https://stackoverflow.com/q/821902/6064933
opt.swapfile = false

-- Ignore certain files and folders when globing
opt.wildignore:append("*.o,*.obj,*.dylib,*.bin,*.dll,*.exe")
opt.wildignore:append("*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**")
opt.wildignore:append("*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico")
opt.wildignore:append("*.pyc,*.pkl")
opt.wildignore:append("*.DS_Store")
opt.wildignore:append("*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv")
opt.wildignorecase=true  -- ignore file and dir name cases in cmd-completion

-- opt.up backup directory
vim.g.backupdir=vim.fn.expand(vim.fn.stdpath('data')..'/backup//')
vim.o.backupdir=vim.g.backupdir

-- Skip backup for patterns in option wildignore
vim.o.backupskip=vim.o.wildignore
opt.backup=true  -- create backup for files
opt.backupcopy='yes'  -- copy the original file to backupdir and overwrite it

-- General tab settings
opt.tabstop=4       -- number of visual spaces per TAB
opt.softtabstop=4   -- number of spaces in tab when editing
opt.shiftwidth=4    -- number of spaces to use for autoindent
opt.expandtab=true       -- expand tab to spaces so that tabs are spaces

-- opt.matching pairs of characters and highlight matching brackets
opt.matchpairs:append("<:>,「:」,『:』,【:】,“:”,‘:’,《:》")

-- Show line number and relative line number
opt.number=true
opt.relativenumber=true

-- Ignore case in general, but become case-sensitive when uppercase is present
opt.ignorecase=true
opt.smartcase=true

-- File and script encoding settings for vim
opt.fileencoding='utf-8'
opt.fileencodings="ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1"

-- Break line at predefined characters
opt.linebreak=true
-- Character to show before the lines that have been soft-wrapped
opt.showbreak='↪'

-- List all matches and complete till longest common string
opt.wildmode="list:longest"

-- Minimum lines to keep above and below cursor when scrolling
opt.scrolloff=3

-- Use mouse to select and resize windows, etc.
opt.mouse='a'  -- Enable mouse in several mode
opt.mousemodel='popup'  -- Set the behaviour of mouse

-- Disable showing current mode on command line since statusline plugins can show it.
opt.showmode=false

opt.fileformats="unix,dos"  -- Fileformats to use for new files

-- Ask for confirmation when handling unsaved or read-only files
opt.confirm=true

opt.visualbell=true
opt.errorbells=false  -- Do not use visual and errorbells
opt.history=500  -- The number of command and search history to keep

-- Use list mode and customized listchars
opt.list=true
opt.listchars="tab:<->,extends:❯,precedes:❮,nbsp:␣"

-- Auto-write the file based on some condition
opt.autowrite=true

-- Show hostname, full path of file and last-mod time on the window title. The
-- meaning of the format str for strftime can be found in
-- http://man7.org/linux/man-pages/man3/strftime.3.html. The function to get
-- lastmod time is drawn from https://stackoverflow.com/q/8426736/6064933
opt.title=true
opt.titlestring="%{utils#Get_titlestr()}"

-- Persistent undo even after you close a file and re-open it
opt.undofile=true

-- Do not show "match xx of xx" and other messages during auto-completion
opt.shortmess:append("c")

-- Do not show search match count on bottom right (seriously, I would strain my
-- neck looking at it). Using plugins like vim-anzu or nvim-hlslens is a better
-- choice, IMHO.
opt.shortmess:append("S")

-- Completion behaviour
-- opt.completeopt+=noinsert  " Auto select the first completion entry
opt.completeopt:append("menuone")  -- Show menu even if there is only one item
-- opt.completeopt-=preview  -- Disable the preview window if you want

opt.pumheight=10  -- Maximum number of items to show in popup menu
opt.pumblend=10  -- pseudo transparency for completion menu

opt.winblend=5  -- pseudo transparency for floating window

-- Insert mode key word completion setting
opt.complete:append('kspell')
opt.complete:remove('w')
opt.complete:remove('b')
opt.complete:remove('u')
opt.complete:remove('t')

opt.spelllang=en,cjk  -- Spell languages
opt.spellsuggest:append('9')  -- show 9 spell suggestions at most

-- Align indent to next multiple value of shiftwidth. For its meaning,
-- see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
opt.shiftround=true

opt.virtualedit='block'  -- Virtual edit is useful for visual block edit

-- Correctly break multi-byte characters such as CJK,
-- see https://stackoverflow.com/q/32669814/6064933
opt.formatoptions:append('mM')

-- Tilde (~) is an operator, thus must be followed by motions like `e` or `w`.
opt.tildeop=true

opt.synmaxcol=200  -- Text after this column number is not highlighted
opt.startofline=false

-- External program to use for grep command
if (vim.fn.executable('rg'))
then
  opt.grepprg="rg --vimgrep --no-heading --smart-case"
  opt.grepformat="%f:%l:%c:%m"
end

-- Enable true color support. Do not opt.this option if your terminal does not
-- support true colors! For a comprehensive list of terminals supporting true
-- colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
opt.termguicolors=true

-- opt.up cursor color and shape in various mode, ref:
-- https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
opt.guicursor="n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20"

opt.signcolumn="auto:2"

-- Remove certain character from file name pattern matching
opt.isfname:remove('=')
opt.isfname:remove(',')

-- diff options
opt.diffopt=""
opt.diffopt:append('vertical')  -- show diff in vertical position
opt.diffopt:append('filler')  -- show filler for deleted lines
opt.diffopt:append('closeoff')  -- turn off diff when one file window is closed
opt.diffopt:append("context:3")  -- context for diff
opt.diffopt:append("internal,indent-heuristic,algorithm:histogram")

opt.wrap=true  -- do wrap
